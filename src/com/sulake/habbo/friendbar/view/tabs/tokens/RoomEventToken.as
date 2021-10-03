package com.sulake.habbo.friendbar.view.tabs.tokens
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.habbo.friendbar.data.FriendNotification;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class RoomEventToken extends Token
   {
       
      
      public function RoomEventToken(param1:IFriendEntity, param2:FriendNotification, param3:IHabboWindowManager, param4:IAssetLibrary, param5:Boolean)
      {
         super(param2,param3,param4);
         prepare("${friendbar.notify.event}",param2.message,"message_piece_xml","event_notification_icon_png","small_event_notification_icon_png",param5);
      }
   }
}
