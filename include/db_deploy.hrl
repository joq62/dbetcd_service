
-define(TABLE,deploy).
-define(RECORD,deploy).

-record(?RECORD,{
		 id,
		 provider_id,
		 node,
		 dir,
		 creation_time
		}).
