#!/bin/bash
# Copyright 2019 George Lukyanov Licensed under the Apache License, Version 2.0 (the «License»);

base_url=http://tb-notificationsrv-prod.textback.io/notification
token=""
webhook_url=""

ch=(
  "new_message"
  "ChannelConnected"
  "ChannelCreateQrCodeChallenge"
  "ChannelCreationCommand"
  "ChannelDisconnected"
  "ChannelMessageReadCommand"
  "ConversationStartContextUpdateCommand"
  "ChatsMergedCommand"
  "ChatMemoChanged"
  "DhSendFailed"
  "DhSendSuccess"
  "EndUserActionCommand"
  "EndUserActivatedNotificationDeepLink"
  "EndUserSubscribedOnNotification"
  "EndUserUnsubscribedFromNotification"
  "MessageDeliveryCommand"
  "NewChatCreatedCommand"
  "OperatorReadChatCommand"
  "OperatorUnReadChatCommand"
  "PaymentProcessedCommand"
  "RecurrentPaymentFailed"
  "RecurrentPaymentSuccess"
  "SubscriptionActivated"
  "SubscriptionClosed"
  "SubscriptionCreated"
  "SubscriptionSuspended"
  "SubscriptionUsageAuthorized"
  "SubscriptionUsageDeauthorized"
  "TagAssignedOnChatCommand"
  "TagRemovedFromChatCommand"
  "WidgetCreateCommand"
  "WidgetDeleteCommand"
  "WidgetDisableCommand"
  "WidgetEnableCommand"
  "WidgetUpdateCommand"
)


exec 3>&1

VALUES=$(dialog \
  --ok-label "Use" \
  --cancel-label "Cancel" \
  --backtitle "TextBack webhooks connetion tool" \
  --title "TextBack webhook connection" \
  --form "Enter webhook data" \
  10 50 0 \
  "API Token:"      1 1 "$token"        1 13 1500 0 \
  "Webhook Url:"    2 1 "$webhook_url"  2 13 100 0 \
\
  --clear \
  --ok-label "Connect webhook" \
  --cancel-label "Cancel" \
  --backtitle "TextBack webhooks connetion tool" \
  --title "TextBack webhook connection" \
  --checklist "Select webhook events" \
  10 50 0 \
  "1" "${ch[0]}" ON \
  "2" "${ch[1]}" OFF \
  "3" "${ch[2]}" OFF \
  "4" "${ch[3]}" OFF \
  "5" "${ch[4]}" OFF \
  "6" "${ch[5]}" OFF \
  "7" "${ch[6]}" OFF \
  "8" "${ch[7]}" OFF \
  "9" "${ch[8]}" OFF \
  "10" "${ch[9]}" OFF \
  "11" "${ch[10]}" OFF \
  "12" "${ch[11]}" OFF \
  "13" "${ch[12]}" OFF \
  "14" "${ch[13]}" ON \
  "15" "${ch[14]}" OFF \
  "16" "${ch[15]}" OFF \
  "17" "${ch[16]}" OFF \
  "18" "${ch[17]}" OFF \
  "19" "${ch[18]}" OFF \
  "20" "${ch[19]}" OFF \
  "21" "${ch[20]}" OFF \
  "22" "${ch[21]}" OFF \
  "23" "${ch[22]}" OFF \
  "24" "${ch[23]}" OFF \
  "25" "${ch[24]}" OFF \
  "26" "${ch[25]}" OFF \
  "27" "${ch[26]}" OFF \
  "28" "${ch[27]}" OFF \
  "29" "${ch[28]}" OFF \
  "30" "${ch[29]}" OFF \
  "31" "${ch[30]}" OFF \
  "32" "${ch[31]}" OFF \
  "33" "${ch[32]}" OFF \
  "34" "${ch[33]}" OFF \
  "35" "${ch[34]}" OFF \
2>&1 1>&3)

exec 3>&-

data=(${VALUES[@]})

token="${data[0]}"
webhook_url="${data[1]}"

if [ `expr length "${token}"` -le 3 ];
then
  dialog --infobox "Check the correctness of the entered data" 0 0
  exit
fi

if [ `expr length "${webhook_url}"` -le 3 ];
then
  dialog --infobox "Check the correctness of the entered data" 0 0
  exit
fi

data=( ${data[@]/$token} )
data=( ${data[@]/$webhook_url} )

declare -a events
for i in "${data[@]}"
do
  if [ "${ch[$i-1]}" == "${ch["${data[-1]}"-1]}" ];
  then
    events+=(\""${ch[$i-1]}"\")
  else
    events+=(\""${ch[$i-1]}"\",)
  fi
done

curl -v $base_url/webhooks -X POST --data "{\"url\":\"$webhook_url\",\"events\":[${events[@]}]}" -H "Authorization: Bearer $token"
echo
echo Save responsed message!
