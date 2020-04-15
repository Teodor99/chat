-author("Teodor").

-type user_name() :: atom().
-type client() :: {pid(), tag(), user_name()}. % the tag() here is the unique tag
-type tag() :: term().
-type message() :: {user_name(), string()}.
-type command() :: {join, user_name()} | {say, string()} | part | get_clients | get_history.
-type chat_server_response() :: {said, user_name(), string()} | {history, [message()]} | already_joined | unknown_user.