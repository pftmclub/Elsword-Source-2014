﻿ALTER TABLE [dbo].[WIUser] ADD
CONSTRAINT [FK_WIUser_Users] FOREIGN KEY ([LoginUID]) REFERENCES [dbo].[users] ([LoginUID]) ON DELETE CASCADE ON UPDATE CASCADE

