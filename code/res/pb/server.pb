
�s
server.protoserver"
	heartbeat
now ("<
defaultResponse
code (
msg (	
opCode (
onEntry"
userInfo (2.server.UserInfo
unixTime (
	heartbeat (%

guideInfos (2.server.GuideInfo"d

onJoinGame
seatId ("
gameInfo (2.server.GameInfo"
diceInfo (2.server.DiceInfo"-
setDice"
diceInfo (2.server.DiceInfo"W

GoldUpdate
seatId (

goldBefore (
	goldAfter (

goldChange ("G
reroll
uid (	
seatId ( 
list (2.server.GoldUpdate"T
	gameStart
betBase (
	betBaseLv (#
players (2.server.PlayerBase"2
turn
seatId (
countdownTimeStamp ("/
	callPoint"
callInfo (2.server.CallInfo"3
openDiceBox

openSeatId (
multiple ("7
betTime
countdownTimeStamp (
multiple ("]
	leaveGame
uid (	
seatId (
type (2.server.LeaveType

isAudience ("�
gameOver"
callInfo (2.server.CallInfo

openSeatId (
multiple (.
resultUserList (2.server.ResultUserInfo
hasBetResult (,

nextGameCountdownStamp (

totalCount (
isTypeOneDiceUsed	 ("?
nextGameCountdownStampRefresh
nextGameCountdownStamp ("4
gamePlayerGoldUpdate
seatId (
gold ("&
newItem
items (2.server.Item"1
updateUserAssets
gold (
diamond ("
onEnterHome
inRoom ("U

nextBetBase (
nextBetBaseLevel (

betBaseUpdateTime
countdownTimeStamp (
seatId (
uid (	
betBase ("6
updatePlayerInfo"
userInfo (2.server.UserInfo"Q
updatePrizePool

totalPrize (*
currentBetUser (2.server.FriendInfo"#
updateNickNameError
code ("@
betBaseUpdateVote
uid (	
seatId (
accept ("1
updateUserItems
itemInfo (2.server.Item")
bagList
itemInfo (2.server.Item"I
audienceListUpdate$
audience (2.server.PlayerBase
isAdd ("I
playerListUpdate&

playerInfo (2.server.PlayerBase
isAdd ("8
seatChanged
beforeSeatId (
afterSeatId ("(
openErrorGoldNotEnough
seatId (""
defaultPopResponse
code ("
tokenInvalid
code ("
sitDownErrorGoldNotEnough"/
RechargeInfo

id (	
isPurchased ("
	userShops"
shopList (2.server.ShopInfo"
userShopLog (2
rechargeInfo (2.server.RechargeInfo")
userShopLog
log (2
shopBuy
gain (2.server.Item
isFirstRecharge (
chargeNoviceProductTime (
	isSandBox (",
kick
reasonId (

expireTime ("B
gainRegisterReward
gotTime (
items (2.server.Item"&
gainRescueGold
currentCount (""
guideStepUpdateAck
step ("-
	vipChange
vipLevel (
vipExp ("C
itemExpired
avatarFrame (
bubble (
diceBox ("@
AvatarFrame
itemId (
isNew (

expireTime ("0

diceBox (
seatId ("V
avatarAndFrameList

avatarList (	,
avatarFrameList (2.server.AvatarFrame",
matchingRoom
roomId (
time ("
quitMatchResponse

ok ("
matchGameAck
code (""
s2cGamingPlayerNum
nums ("~
betPrize
believeEnoughTimes (
believeEnoughGold (
believeNotEnoughTimes (
believeNotEnoughGold ("&
mailList
list (2.server.Mail"C
updateMailState
mailId ( 
state (2.server.MailState"%
newMail
mail (2.server.Mail"

deleteMail
mailIds ("?
receiveMail
mailId ( 
state (2.server.MailState",
receiveMailAll
list (2.server.Mail"o
	broadcast/

templateId (2.server.BroadcastTemplateId

zh (	

tw (	

en (	
param (	"H
Item
itemId (
itemType (
itemNum (
isNew ("�
ResultUserInfo
seatId ("
diceInfo (2.server.DiceInfo
diceComposeType (
goldChangeBeforeTax (
goldChangeAfterTax (
gold ("�

uid (	
betGold (
goldChangeBeforeTax (
goldChangeAfterTax (

avatar (	"
DiceInfo
point (
CallInfo
seatId (
point (
num ("7
PersonalRoomInfo
	masterUid (	
roomName (	"�
GameInfo$
	roomState (2.server.RoomState"
voteInfo (2.server.VoteInfo
betBase (
betBaseLevel (
roomConfigId ("
currentCallingPlayerSeatId (
countdownEndStamp (
dealerSeatId (
questionerSeatId	 ()
currentCallInfo
 (2.server.CallInfo
isTypeOneDiceUsed (
rounds (
roomId
gameType (2.server.GameType#
players (2.server.PlayerBase%
	audiences (2.server.PlayerBase)
firstOne (2.server.PlayerBriefInfo$
	gameState (2.server.GameState'
betUserList (2.server.FriendInfo
multiple (.
personalInfo (2.server.PersonalRoomInfo")
UidVote
seatId (
accept ("t
VoteInfo
isVoting ($
uidVoteList (2.server.UidVote0

PlayerBriefInfo
seatId (
uid (	"�

PlayerBase
uid (	
nickname (	
sex (
vipLevel (
avatar (	
isSystemAvatar (
avatarFrame (
bubble ((
onlineState	 (2.server.OnlineState
gold
 (
seatId (
diceBox (
isOnline
	isPlaying (
fansNum (
slogan (	"�
UserInfo
uid (	
nickname (	
sex (
avatar (	
avatarFrame (
gold (
diamond (

createTime (

serverTimeZero
 (
	inviterId (	
vipLevel (
fansNum
slogan (	
isSystemAvatar (
diceBox (
isChangedSex (
isChangedNickname (
bubble (
shareUrl (	
vipExp (
canGainVipLevelReward (
chargeNoviceProductTime (
gotRegisterRewardTime (
dailyReliefCount (
	guideStep (
isFirstLogin (
isParam ("*
Goods
goodsId (
buyTimes ("
ShopInfo
shopId ("�
Mail
mailId ( 
state (2.server.MailState

templateId (
title (	
content (	
sign (	
param (	 

attachment (2.server.Item
	createdAt	 (
	expiredAt
 ("*
getTask
tasks (2.server.TaskInfo"?

taskUpdate

id (
cmpNow (

TaskInfo

id (
cmpNow (
received (
kind (2.server.TaskKind



id ("
nextTask (2.server.TaskInfo"i


playerInfo (2.server.FriendInfo
createdTime (
items (2.server.Item"v
taskInvitedPlayer&
players (2.server.InvitedFriend%
kind (2.server.TaskInvitedKind

dailyCount ("�

FriendInfo
uid (	
nickname (	
sex (
avatar (	
isSystemAvatar ((
onlineState (2.server.OnlineState
avatarFrame (
vipLevel (
fansNum	 (
slogan
 (	$
status (2.server.FriendStatus
unReadMsgNum (
gold
roomConfigId (".

friendList 
list (2.server.FriendInfo"4
friendSearchList 
list (2.server.FriendInfo"5
friendRequestList 
list (2.server.FriendInfo"-
	blacklist 
list (2.server.FriendInfo"2
addFriendResponse
	friendUid (	

ok ("-
deleteFriend
	friendUid (	

ok ("=
blockFriend

ok ("
friend (2.server.FriendInfo"2
cancelBlockFriend
	friendUid (	

ok ("W
addFriendAgree
isAgree ("
friend (2.server.FriendInfo
applyUid (	"7
recommendFriendList 
list (2.server.FriendInfo":
requestedToAddFriend"
friend (2.server.FriendInfo"8
cancelAddFriendResponse

ok (
	friendUid (	"0
cancelAddFriend

ok (
	friendUid (	"!
friendApplyToList
uids (	"d
friendNetStatus(
onlineState (2.server.OnlineState
	friendUid (	
roomConfigId ("c
friendInfoUpdate
uid (	
nickname (	
avatar (	
avatarFrame (
sex (
friendGoldUpdate
uid (	
gold (";
friendAddRequestBroadcast
fromUid (	
toUid (	"J
friendAddAgreeBroadcast
fromUid (	
toUid (	
isAgree ("z
sendChatMsgAck
	messageId (	
content (	
isText (
sendAt ($
channel (2.server.ChatChannel"�
Chat
	messageId (	
isRead (
toUid (	
content (	
isText (
sendAt ( 
from (2.server.FriendInfo"<
receiveFriendChatMessageOne
message (2.server.Chat"V
receiveChatMessage$
channel (2.server.ChatChannel
list (2.server.Chat"y
sendFriendChatMsgAck
	messageId (	
content (	
isText (
toUid (	
sendAt (
isRead ("6
receiveFriendChatMessage
list (2.server.Chat"*
readFriendChatMsgAck

messageIds (	"=
updateUnreadMsgNum
unReadMsgNum (
	friendUid (	"!
sendMagicEmojiAck
code ("<

magicEmoji
fromUid (	
toUid (	
itemId ("/
getInvitedReward
items (2.server.Item"I
RedPoint0
subcategory (2.server.RedPointSubcategory
num ("*
redPoint
list (2.server.RedPoint"
removeRedPointAck

ok ("!
s2cPlayerIdsOnline
ids (	"H
s2cPlayerInfoForPlaymate,
infos (2.server.PlayerInfoForPlaymate"�
PlayerInfoForPlaymate
uid (	"
language (2.server.Language
isBot (

isPlaymate (
currentPlaymateIds (	*
playerStatus (2.server.PlayerStatus
nickname (	
sex (
avatar	 (	
avatarFrame
 (
vipExp (

createTime (
roomId

isOperator (
roomConfigId ("q
PlayerAvatarInfo
uid (	
name (	
avatar (	
vipLevel (
avatarFrame (
sex ("I
	BaoziInfo(
player (2.server.PlayerAvatarInfo

baoziDiget ("e
s2cBigSmallBet$
betType (2.server.BetDiceType
gold (

diceResult (
win ("�
s2cBigSmallStateInfo$
state (2.server.BigSmallState 
baozi (2.server.BaoziInfo*
goodLuck (2.server.PlayerAvatarInfo"�
s2cBigSmallBankerInfo(
banker (2.server.PlayerAvatarInfo

bankerCost (*
	leaveType (2.server.BankerLeaveType"?
s2cBigSmallPoolUpdate
poolNow (

s2cBigSmallBaozi 
baozi (2.server.BaoziInfo"N
s2cBigSmallRobResult(
player (2.server.PlayerAvatarInfo
gold ("U
RobInfo(
player (2.server.PlayerAvatarInfo
	goldTotal (
count ("U
s2cBigSmallRobRank
list (2.server.RobInfo
	goldTotal (
count ("�
BigSmallBetInfo(
player (2.server.PlayerAvatarInfo$
betType (2.server.BetDiceType
win (

diceResult (
goldWin (";
s2cBigSmallBetList%
list (2.server.BigSmallBetInfo"�

banker (2.server.PlayerAvatarInfo
chip (
robCost (2
	offReason (2.server.ShaibaoBanker.OffReason
diceBox (
gold ("N
	OffReason
TimeOver

ReqOff

BeKicked
On"!
ShaibaoDiceRecord
dice ("�
ShaibaoBetInfo
uid (	
avatar (	
chip ((
betType (2.server.ShaibaoDiceType
isAllin (
avatarFrame ("�
s2cShaibaoInfo%
banker (2.server.ShaibaoBanker+
	secBanker (2.server.PlayerAvatarInfo

betList (2.server.ShaibaoBetInfo'
	gameState (2.server.ShaibaoState
timeLeft (-

diceRecord (2.server.ShaibaoDiceRecord%
area (2.server.ShaibaoDiceType"b
s2cShaibaoDouble%
area (2.server.ShaibaoDiceType'
betInfo (2.server.ShaibaoBetInfo"'
s2cShaibaoStart
openTimeLeft ("�
s2cShaibaoRobBanker2
result (2".server.s2cShaibaoRobBanker.Result"V
Result
Ok
Err
ErrCostNotEnough
ErrGoldNotEnough
RepeatedRob"l
s2cShaibaoBankerUpdate%
banker (2.server.ShaibaoBanker+
	secBanker (2.server.PlayerAvatarInfo"8

betInfo (2.server.ShaibaoBetInfo"�
s2cShaibaoResult4
	betResult (2!.server.s2cShaibaoResult.BetRsultc
BetRsult
uid (	(
betType (2.server.ShaibaoDiceType
chipBet (
chipWin ("
s2cShaibaoBankerOff"O
s2cShaibaoGameover
timeLeft ('
dice (2.server.ShaibaoDiceRecord"O
s2cShaibaoMagicEmojiBroadcast
fromUid (	
toUid (	
itemId ("=


avatarInfo (2.server.PlayerAvatarInfo"?
s2cGuideGroupUpdateAck%

guideInfos (2.server.GuideInfo"j
	GuideInfo

id (#
status (2.server.GuideStatus
rewards (2.server.Item
isGot ("k
s2cGameInviteBroadcast
uid (	
nickname (	
roomId (	
password (	
roomName (	"K
s2cEnterPersonalRoom#
code (2.server.PersonalError
roomId (	"A
s2cPersonalRoomInfoChanged
roomName (	
	masterUid (	"'
s2cPersonalPassword
password (	*�
BroadcastTemplateId

Custom
BigSmallLuck
BigSmallBet


ShaibaoBet
ShaibaoBankerBekicked*E
GameType
Base
Duel
Soha
	Bullfight
BlackRed*"
	RoomState
Idle
Started*9
	GameState
Wait
CallDice
Bet
GameEnd*I
	LeaveType
Left

Kicked
Offline
StandUp
UserKick*5
	MailState

unread

unreceived
received*`
TaskKind
Newcomer
Day
Week

Invite

Season

Events
NoviceLogin*6
TaskInvitedKind	
click
register

charge*?
FriendStatus
none

requesting

friend	
block*U
OnlineState
offline
idle
matching

gaming
watching
ban*$
ChatChannel
room
shaibao*�
RedPointSubcategory
diceList
friendApplyList

mailButton
inviteAwardButton
inviteFriendClick	
inviteFriendRegister

inviteFriendCharge

avatarList
nicknameEditButton

avatarEditButton*"
Language
zh
tw
en*,
PlayerStatus
	DoNothing
	BluffRoom*!
BetDiceType
Big	
Small*=


Unopen
BigSmall	
Baozi
Rob*G
BankerLeaveType
Default

ReqOff

Race*�
ShaibaoDiceType

Count1

Count2

Count3

Count4

Count5

Count6
BigDice
	SmallDice

Single	

Double


Series
Same*$
ShaibaoState
Init

Beting*b
GuideStatus
NotTriggered
TriggeredButNotFinished
QuitButNotFinished
Finished*�

SeatFull��
GameStatusError̵
GoldNotEnoughToJoinRoom��

PersonalRoomNotExist��
NeedPassword��