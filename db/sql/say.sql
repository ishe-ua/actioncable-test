-- See models/chat.rb
-- select say(1, 2, 'bb');

CREATE OR REPLACE FUNCTION say(integer, integer, varchar) RETURNS integer AS $$
DECLARE
        chat_id integer;
BEGIN
        SELECT id INTO chat_id FROM chats WHERE a_id=$1 AND b_id=$2;
        IF chat_id > 0 THEN
           UPDATE chats SET log=array_append(log, $3::text), updated_at=now() WHERE id=chat_id;
        ELSE
           INSERT INTO chats (a_id, b_id, log, created_at, updated_at) VALUES ($1, $2, array[$3], now(), now());
        END IF;

        RETURN 1;
END;

$$ LANGUAGE plpgsql;
