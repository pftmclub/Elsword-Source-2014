﻿CREATE PROCEDURE [dbo].[RGR_rank_grandchaser_daily_select_nick]
	@strNick_ [nvarchar](24),
	@iTabType_ [tinyint] = 0
AS
set nocount on

select
    TabType
,   Rank
,   LoginUID
,   GuildID
,   GuildMark
,   GuildName
,   CharType
,   Nick
,   Win
,   Lose
,   WinRate
from dbo.RGRRankGrandchaserDaily
with (nolock)
where
    Nick = @strNick_
and TabType = @iTabType_
option (maxdop 1)

