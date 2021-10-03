package com.sulake.habbo.room
{
   import com.sulake.habbo.room.messages.RoomObjectUpdateStateMessage;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.IVector3d;
   
   public interface IRoomObjectCreator
   {
       
      
      function addObjectFurniture(param1:int, param2:int, param3:int, param4:int, param5:IVector3d, param6:IVector3d, param7:int, param8:String, param9:Number = NaN, param10:int = -1, param11:Boolean = false) : Boolean;
      
      function addObjectFurnitureByName(param1:int, param2:int, param3:int, param4:String, param5:IVector3d, param6:IVector3d, param7:int, param8:String, param9:Number = NaN) : Boolean;
      
      function updateObjectFurniture(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:int, param7:String, param8:Number = NaN) : Boolean;
      
      function updateObjectFurnitureLocation(param1:int, param2:int, param3:int, param4:RoomObjectUpdateMessage) : Boolean;
      
      function disposeObjectFurniture(param1:int, param2:int, param3:int) : void;
      
      function addObjectWallItem(param1:int, param2:int, param3:int, param4:int, param5:IVector3d, param6:IVector3d, param7:int, param8:String, param9:Boolean) : Boolean;
      
      function updateObjectWallItem(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:int, param7:String) : Boolean;
      
      function updateObjectWallItemData(param1:int, param2:int, param3:int, param4:String) : Boolean;
      
      function disposeObjectWallItem(param1:int, param2:int, param3:int) : void;
      
      function addObjectUser(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:Number, param7:int, param8:String = null) : Boolean;
      
      function updateObjectUser(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:IVector3d = null, param7:Number = NaN) : Boolean;
      
      function updateObjectUserState(param1:int, param2:int, param3:int, param4:RoomObjectUpdateStateMessage) : Boolean;
      
      function disposeObjectUser(param1:int, param2:int, param3:int) : void;
      
      function updateObjectRoom(param1:int, param2:int, param3:String = null, param4:String = null, param5:String = null, param6:Boolean = false) : Boolean;
      
      function updateObjectRoomColor(param1:int, param2:int, param3:uint, param4:int, param5:Boolean) : Boolean;
      
      function updateObjectRoomVisibilities(param1:int, param2:int, param3:Boolean, param4:Boolean = true) : Boolean;
      
      function updateObjectRoomPlaneThicknesses(param1:int, param2:int, param3:Number, param4:Number) : Boolean;
      
      function setRoomObjectAlias(param1:String, param2:String) : void;
   }
}
