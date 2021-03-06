/* ---- Start Reset Database SQL ---- */

/* Votes */
Delete From Vote

/* Posts */
Delete FROM Post

/* Poll Votes */
Delete FROM PollVote

/* Poll Answers */
Delete FROM PollAnswer

/* Polls */
Delete FROM Poll

/* Topic Tags + Join */
Delete FROM Topic_Tag
Delete FROM TopicTag

/* Topic Notification */
Delete FROM TopicNotification

/* Topics */
Delete FROM Topic

/* Private Messages */
Delete FROM PrivateMessage

/* Activity */
Delete FROM Activity

/* Badge Check */
Delete FROM BadgeTypeTimeLastChecked

/* Badges */
Delete FROM Badge

/* Category Notifications */
Delete FROM CategoryNotification

Delete FROM WaterResult

/* Delete Category Permissions For Role */
Delete FROM CategoryPermissionForRole

/* Delete Membership User Badge */
Delete FROM MembershipUser_Badge

/* Member Points */
Delete FROM MembershipUserPoints

/* Delete all members apart from Admin */
Delete FROM MembershipUser WHERE UserName <> 'admin'

/* Reset Admin credentials */
UPDATE MembershipUser
SET 
Password = 'Lh7HdU7pOWTiMglEu7x+e2HZvq49F0gv/ib8kaWI3q4=', 
PasswordSalt = 'YmjFAHr9lkzietEs3URdSlP1NqaXvndE',
Email = 'you@email.com'
WHERE UserName = 'admin'

/* Get admin guid = (Select Id From MembershipUser Where UserName = 'admin') as AdminId */
/* Clear all MembershipUsersInRoles except the admins one */
Delete muir  
FROM MembershipUsersInRoles muir
INNER JOIN MembershipUser ON muir.UserIdentifier = MembershipUser.Id
WHERE MembershipUser.UserName <> 'admin'

/* Delete all categories apart from the default example one */
Delete FROM Category WHERE Name <> 'Example Category'

/* Reset Settings */
UPDATE Settings
SET 
[ForumName] = 'MVC Forum', 
[ForumUrl] = 'http://www.mydomain.com', 
[IsClosed] = 0, 
[EnableRSSFeeds] = 1, 
[DisplayEditedBy] = 1, 
[EnablePostFileAttachments] = 0, 
[EnableMarkAsSolution] = 1, 
[EnableSpamReporting] = 1, 
[EnableMemberReporting] = 1, 
[EnableEmailSubscriptions] = 1, 
[ManuallyAuthoriseNewMembers] = 0, 
[EmailAdminOnNewMemberSignUp] = 1, 
[TopicsPerPage] = 20, 
[PostsPerPage] = 20, 
[EnablePrivateMessages] = 1, 
[MaxPrivateMessagesPerMember] = 50, 
[PrivateMessageFloodControl] = 1, 
[EnableSignatures] = 0, 
[EnablePoints] = 1, 
[PointsAllowedToVoteAmount] = 1, 
[PointsAddedPerPost] = 1, 
[PointsAddedPostiveVote] = 2, 
[PointsAddedForSolution] = 4, 
[PointsDeductedNagativeVote] = 2, 
[AdminEmailAddress] = 'my@email.com', 
[NotificationReplyEmail] = 'noreply@myemail.com', 
[SMTP] = NULL, 
[SMTPUsername] = NULL, 
[SMTPPort] = NULL, 
[SMTPEnableSSL] = 0, 
[SMTPPassword] = NULL, 
[Theme] = 'Metro', 
[NewMemberStartingRole] = 'fbf4f43e-1e03-42da-9eec-a03b00900afa', 
[DefaultLanguage_Id] = '629cde2e-11d5-41dd-80fd-ca20bdc9dc17', 
[ActivitiesPerPage] = 20, 
[EnableAkisment] = 0, 
[AkismentKey] = NULL, 
[CurrentDatabaseVersion] = NULL, 
[SpamQuestion] = NULL, 
[SpamAnswer] = NULL, 
[EnableSocialLogins] = 0, 
[EnablePolls] = 1
WHERE Id = '367162b2-6b27-4834-9178-77abeabdb04d'


/* ---- End Reset Database SQL ---- */