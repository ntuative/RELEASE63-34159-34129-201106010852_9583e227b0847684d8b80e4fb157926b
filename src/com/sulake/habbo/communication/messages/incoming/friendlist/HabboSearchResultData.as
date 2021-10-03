package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2292:int;
      
      private var var_1866:String;
      
      private var var_2534:String;
      
      private var var_2538:Boolean;
      
      private var var_2537:Boolean;
      
      private var var_2535:int;
      
      private var var_2536:String;
      
      private var var_2539:String;
      
      private var var_1773:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2292 = param1.readInteger();
         this.var_1866 = param1.readString();
         this.var_2534 = param1.readString();
         this.var_2538 = param1.readBoolean();
         this.var_2537 = param1.readBoolean();
         param1.readString();
         this.var_2535 = param1.readInteger();
         this.var_2536 = param1.readString();
         this.var_2539 = param1.readString();
         this.var_1773 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2292;
      }
      
      public function get avatarName() : String
      {
         return this.var_1866;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2534;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2538;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2537;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2535;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2536;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2539;
      }
      
      public function get realName() : String
      {
         return this.var_1773;
      }
   }
}
