var qid = tby_queue_get_id(global.tbyActiveQueueName);

if (qid == undefined) return -1
return qid