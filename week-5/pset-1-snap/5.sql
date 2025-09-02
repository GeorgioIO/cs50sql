-- For any two users, the app needs to quickly show a list of the friends they have in common.
-- Given two usernames, lovelytrust487 and exceptionalinspiration482, find the user IDs of their mutual friends.
-- A mutual friend is a user that both lovelytrust487 and exceptionalinspiration482 count among their friends.
-- Ensure your query uses the index automatically created on primary key columns of the friends table. This index is called sqlite_autoindex_friends_1.

SELECT f.friend_id
FROM friends f
JOIN users u ON f.user_id = u.id
WHERE u.username = 'lovelytrust487'
INTERSECT
SELECT f.friend_id
FROM friends f
JOIN users u ON f.user_id = u.id
WHERE u.username = 'exceptionalinspiration482';
