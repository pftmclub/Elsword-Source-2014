﻿-- lua header. UTF-8 인코딩 인식을 위해 이 줄은 지우지 마세요.

----------     Login Server 설정     ----------

-- 크래쉬 리포트 메일링 리스트 --
Server:SetMailingList( "honnak@kog.co.kr" )

-- 종료시 db 처리 대기시간 --
Server:SetShutDownWait( 60 * 1000 )

-- 넥슨 passport 인증 레벨
--Server:SetPassportLevel( 2 )

-- Add moritoring server's IP for checking port of elsword's server
Server:AddPortCheckMoritoringServer( "79.110.90.240" )



----------     Login NetLayer 설정     ----------

NetLayer:SetCheckSequenceNum( false ) -- 내부통신은 SequenceNum 체크필요없음


----------     Login SimLayer 설정     ----------
SimLayer:SetUseKogOTP ( true )

-- PublisherBillingConnectType Flag --
--[[
		PBCT_NONE				= 0,	
		// kncSend 떄문에 DBLayer와 일반 Manager 는 구분되어야 함
		PBCT_NORMAL		= 1,	// 일반적인 Manager 통해 (보통은 TCP, SOAP 등)
		PBCT_DB					= 2,	// DB 통신 Manager를 통해
		PBCT_UNUSUAL		= 3,	// 섞어 쓰던가 특이 사항 있는 경우
--]]
SimLayer:SetPublisherBillingConnectType( PBCT_NORMAL )
SimLayer:SetCheckCouponByPublisher ( false )
SimLayer:SetPublisherCheckGameServerLogin ( false ) -- Only Login Server
-- Nation Flag --
--[[
NF_TW     : 대만
NF_HK 	  : 홍콩
--]]
SimLayer:SetNationFlag( NF_IT )

-- Auth Flag --
--[[
AF_INTERNAL    : 사내 인증
AF_NEXON_KOREA : 넥슨 국내 인증
--]]
SimLayer:SetAuthFlag( AF_GLOBAL_SERVICE )

-- Script File Path --
--SimLayer:AddPath( "D:\\Elsword\\1_0_0_1\\Common" ) -- server common
--SimLayer:AddPath( "D:\\Elsword\\1_0_0_1\\ClientScript" ) -- client script
SimLayer:AddPath( "D:\\Elsword\\Server\\ServerResource" ) -- server common
SimLayer:AddPath( "D:\\Elsword\\Server\\ClientScript" ) -- client script


----------     DB Layer 설정     ----------

-- 접속 DB 목록 --
--[[
DC_ACCOUNT         : 계정
DC_GAME            : 게임
DC_LOG             : 통계
DC_NX_WEB		   : 넥슨 WEB
--]]
-- AddDB( DB 종류, file dsn, thread 개수, DBConnectionString여부 )


DBLayer:AddDB( DC_ACCOUNT,	'Account_GAMEFORGE_IT_LIVE.dsn',	15, false )
DBLayer:AddDB( DC_GAME,		'Game01_GAMEFORGE_IT_LIVE.dsn',	15, false )
DBLayer:AddDB( DC_LOG,			'Log_GAMEFORGE_IT_LIVE.dsn',		10, false )


----------     인증 설정     ----------

-- PC 방 인증 정보 --
-- InitNexonBillingAuthInfo( 인증 서버 IP, 인증 서버 Port, 서버 도메인, 도메인네임 )


----------     로그 레벨 설정     ----------

-- 로그 레벨 --
--[[
-1 : no logs
 0 : cerr, cout
 1 : cerr, cwarn, cout
 2 : cerr, cwarn, clog, cout
--]]
log( 0 )