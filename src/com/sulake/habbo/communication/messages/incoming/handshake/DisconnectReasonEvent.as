package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2081:int = 0;
      
      public static const const_1936:int = 1;
      
      public static const const_1686:int = 2;
      
      public static const const_2187:int = 3;
      
      public static const const_2028:int = 4;
      
      public static const const_2138:int = 5;
      
      public static const const_1941:int = 10;
      
      public static const const_2032:int = 11;
      
      public static const const_2162:int = 12;
      
      public static const const_2188:int = 13;
      
      public static const const_2027:int = 16;
      
      public static const const_2129:int = 17;
      
      public static const const_2159:int = 18;
      
      public static const const_2073:int = 19;
      
      public static const const_2098:int = 20;
      
      public static const const_2178:int = 22;
      
      public static const const_2085:int = 23;
      
      public static const const_2181:int = 24;
      
      public static const const_2198:int = 25;
      
      public static const const_2121:int = 26;
      
      public static const const_2047:int = 27;
      
      public static const const_2025:int = 28;
      
      public static const const_2145:int = 29;
      
      public static const const_2220:int = 100;
      
      public static const const_2149:int = 101;
      
      public static const const_2118:int = 102;
      
      public static const const_2136:int = 103;
      
      public static const const_2224:int = 104;
      
      public static const const_2131:int = 105;
      
      public static const const_2035:int = 106;
      
      public static const const_2045:int = 107;
      
      public static const const_2193:int = 108;
      
      public static const const_2055:int = 109;
      
      public static const const_2177:int = 110;
      
      public static const const_2034:int = 111;
      
      public static const const_2070:int = 112;
      
      public static const const_2117:int = 113;
      
      public static const const_2033:int = 114;
      
      public static const const_2200:int = 115;
      
      public static const const_2210:int = 116;
      
      public static const const_2155:int = 117;
      
      public static const const_2231:int = 118;
      
      public static const const_2106:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1936:
            case const_1941:
               return "banned";
            case const_1686:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
