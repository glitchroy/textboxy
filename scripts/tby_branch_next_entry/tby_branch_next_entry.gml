var q = tby_branch_get_active_id()
if (q == undefined || q == -1) {
    exit;
}

if (tby_list_exists(q)) {
    #region List Empty
    if (tby_list_finished(q)) {
        //current list is finished
        //destroy
        tby_branch_destroy(global.tby_active_list_name)
        
        tby_hook_branch_finished()
        
        exit;
    }
    #endregion
    
    //release and create new textbox
    var tbData = tby_list_advance(q)
    
    if (tbData == undefined) { tby_branch_destroy(global.tby_active_list_name) }
    
    #region ChoiceResult
    // first, check for ChoiceResult. Since there can be a nested
    // TbyType action, just unfold it
    if (tbData[0] == TbyType.ChoiceResult) {
        if (tbData[1] == global.tby_choice_result) {
            //0: tbyType.choiceResult
            //1: Choice num to match
            //2: ... usual payload
            
            var tempData = [];
            array_copy(tempData, 0, tbData, 2, tby_arrlen(tbData)-2)
            tbData = 0;
            tbData = tempData;
        } else {
            // skip this entry
            tby_branch_next_entry()
        }
    }
    #endregion
    
    #region Quick Modes
    if (is_array(tbData) == false && is_string(tbData)) {
        // just a string, imply simple text box
        // If bubble char is first char, use TbyType.Bubble
        // Otherwise, use TbyType.Normal
        
        var s = tbData;
        tbData = 0;
        
        if (string_char_at(s, 1) == tby_quick_mode_bubble_char) {
            // Bubble Mode
            tbData[0] = TbyType.Bubble
            // Strip the extra character
            tbData[1] = string_delete(s, 1, 1)
        } else {
            // Normal Mode
            tbData[0] = TbyType.Normal
            tbData[1] = s
        }
    }
    
    // This is the case when there is a Batch entry with
    // quick modes
    if (is_array(tbData) && is_string(tbData[0])) {
        var isBubble, type;
        isBubble = string_char_at(tbData[0], 1) == tby_quick_mode_bubble_char
        type = isBubble ? TbyType.Bubble : TbyType.Normal;
        
        var newArr = tby_concat([type], tbData);
        tbData = 0;
        tbData = newArr;
        
        //Delete bubble char
        if (isBubble) tbData[1] = string_delete(tbData[1], 1, 1)
    }
    
    #endregion
    
    //0: is always the TbyType
    switch (tbData[0]) {
        case TbyType.Normal:
            //1: string
            //2: positional data
            if (tby_arrlen(tbData) < 3) tbData[2] = global.tby_current_options_map[? TbyOption.SetPlacement]
            tby_normal_create(tbData[1], tbData[2]);
        break;
        case TbyType.Bubble:
            //1: string
            //2: instance talking
            
            //use global instance if none is given
            if (tby_arrlen(tbData) < 3) tbData[2] = global.tby_current_options_map[? TbyOption.SetInstance]
            
            // check if its a string thats an object type (from json usually)
            if (is_string(tbData[2])) {
                var objectId = asset_get_index(tbData[2]);
                if (objectId != -1) tbData[2] = objectId
            } else if (tbData[2] == undefined || !instance_exists(tbData[2])) {
                // sanity check
                tby_log("No valid instance specified for bubble textbox, using ", id, "as substitute.")
                tbData[2] = id //just use the calling instance
            }
            tby_bubble_create(tbData[1], tbData[2])
        break;
        case TbyType.Choice:
            //1: string
            //2: choiceArray
            //3: positional data
            if (tby_arrlen(tbData) < 4) tbData[3] = TbyPlacement.Auto;
            tby_choice_create(tbData[1], tbData[2], tbData[3]);
        break;
        case TbyType.Option:
            //option
            tby_set_option(tbData[1], tbData[2])
        break;
        case TbyType.Wait:
            //wait time
            with (tby_object_manager) alarm[0] = room_speed*tbData[1]
        break;
        case TbyType.Batch:
            //1: array of other textboxes
            if (is_array(tbData[1])) {
                tby_handle_batch_entry(tbData[1]);
            }
        break;
        case TbyType.Terminate:
            tby_list_clear(q);
            tby_branch_next_entry();
        break;
        case TbyType.Label:
            //1: label name
            global.tby_current_labels_map[? tbData[1]] = tby_list_get_pointer(tby_branch_get_active_id());
            tby_branch_next_entry();
        break;
        case TbyType.GoTo:
            //1: label name
            var label = global.tby_current_labels_map[? tbData[1]];
            if (label != undefined) {
                tby_list_set_pointer(tby_branch_get_active_id(), label)
            }
            tby_branch_next_entry();
        break;
    }
    
}