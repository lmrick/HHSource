package package_31
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_435 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_435(param1:class_1365)
      {
         var _loc4_:* = null;
         var_20 = [];
         super();
         var_20.push(param1.roomId);
         var_20.push(param1.name);
         var_20.push(param1.description);
         var_20.push(param1.doorMode);
         var_20.push(param1.password !== null ? param1.password : "");
         var_20.push(param1.maximumVisitors);
         var_20.push(param1.categoryId);
         if(param1.tags)
         {
            _loc4_ = [];
            for each(var _loc3_ in param1.tags)
            {
               if(_loc3_ && _loc3_ !== "")
               {
                  _loc4_.push(_loc3_);
               }
            }
            var_20.push(_loc4_.length);
            for each(var _loc2_ in _loc4_)
            {
               var_20.push(_loc2_);
            }
         }
         else
         {
            var_20.push(0);
         }
         var_20.push(param1.tradeMode);
         var_20.push(param1.allowPets);
         var_20.push(param1.allowFoodConsume);
         var_20.push(param1.allowWalkThrough);
         var_20.push(param1.hideWalls);
         var_20.push(param1.wallThickness);
         var_20.push(param1.floorThickness);
         var_20.push(param1.whoCanMute);
         var_20.push(param1.whoCanKick);
         var_20.push(param1.whoCanBan);
         var_20.push(param1.chatMode);
         var_20.push(param1.chatBubbleSize);
         var_20.push(param1.chatScrollUpFrequency);
         var_20.push(param1.chatFullHearRange);
         var_20.push(param1.chatFloodSensitivity);
         var_20.push(param1.allowNavigatorDynCats);
      }
      
      public function getMessageArray() : Array
      {
         return var_20;
      }
      
      public function dispose() : void
      {
         var_20 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
