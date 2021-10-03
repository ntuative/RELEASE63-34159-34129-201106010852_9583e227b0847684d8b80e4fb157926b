package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_463:String = "RWUAM_WHISPER_USER";
      
      public static const const_538:String = "RWUAM_IGNORE_USER";
      
      public static const const_516:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_413:String = "RWUAM_KICK_USER";
      
      public static const const_556:String = "RWUAM_BAN_USER";
      
      public static const const_581:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_528:String = "RWUAM_RESPECT_USER";
      
      public static const const_465:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_482:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_576:String = "RWUAM_START_TRADING";
      
      public static const const_903:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_624:String = "RWUAM_KICK_BOT";
      
      public static const const_602:String = "RWUAM_REPORT";
      
      public static const const_564:String = "RWUAM_PICKUP_PET";
      
      public static const const_1696:String = "RWUAM_TRAIN_PET";
      
      public static const const_577:String = " RWUAM_RESPECT_PET";
      
      public static const const_390:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_612:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
