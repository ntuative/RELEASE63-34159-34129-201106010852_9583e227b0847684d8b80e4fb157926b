package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1300:int = 1;
      
      public static const const_736:int = 2;
      
      public static const const_911:int = 3;
      
      public static const const_1724:int = 4;
       
      
      private var _index:int;
      
      private var var_2687:String;
      
      private var var_2684:String;
      
      private var var_2686:Boolean;
      
      private var var_2685:String;
      
      private var var_990:String;
      
      private var var_2688:int;
      
      private var var_2486:int;
      
      private var _type:int;
      
      private var var_2457:String;
      
      private var var_1019:GuestRoomData;
      
      private var var_1020:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2687 = param1.readString();
         this.var_2684 = param1.readString();
         this.var_2686 = param1.readInteger() == 1;
         this.var_2685 = param1.readString();
         this.var_990 = param1.readString();
         this.var_2688 = param1.readInteger();
         this.var_2486 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1300)
         {
            this.var_2457 = param1.readString();
         }
         else if(this._type == const_911)
         {
            this.var_1020 = new PublicRoomData(param1);
         }
         else if(this._type == const_736)
         {
            this.var_1019 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_1019 != null)
         {
            this.var_1019.dispose();
            this.var_1019 = null;
         }
         if(this.var_1020 != null)
         {
            this.var_1020.dispose();
            this.var_1020 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2687;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2684;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2686;
      }
      
      public function get picText() : String
      {
         return this.var_2685;
      }
      
      public function get picRef() : String
      {
         return this.var_990;
      }
      
      public function get folderId() : int
      {
         return this.var_2688;
      }
      
      public function get tag() : String
      {
         return this.var_2457;
      }
      
      public function get userCount() : int
      {
         return this.var_2486;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_1019;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_1020;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1300)
         {
            return 0;
         }
         if(this.type == const_736)
         {
            return this.var_1019.maxUserCount;
         }
         if(this.type == const_911)
         {
            return this.var_1020.maxUsers;
         }
         return 0;
      }
   }
}
