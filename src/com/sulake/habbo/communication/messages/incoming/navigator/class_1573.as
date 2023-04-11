package package_11
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1573 implements class_13
   {
       
      
      private var var_1287:int;
      
      private var var_686:int;
      
      private var var_1035:String;
      
      private var _flatId:int;
      
      private var var_415:int;
      
      private var var_809:int;
      
      private var var_1091:String;
      
      private var var_1285:String;
      
      private var _creationTime:String;
      
      private var var_1236:Date;
      
      private var _disposed:Boolean;
      
      public function class_1573(param1:IMessageDataWrapper)
      {
         super();
         var_1287 = param1.readInteger();
         var_686 = param1.readInteger();
         var_1035 = param1.readString();
         _flatId = param1.readInteger();
         var_809 = param1.readInteger();
         var_1091 = param1.readString();
         var_1285 = param1.readString();
         var _loc8_:int = param1.readInteger();
         var _loc5_:int = param1.readInteger();
         var _loc9_:Date;
         var _loc3_:Number = (_loc9_ = new Date()).getTime();
         var _loc2_:Number = _loc8_ * 60 * 1000;
         _loc3_ -= _loc2_;
         var _loc6_:Date;
         _creationTime = (_loc6_ = new Date(_loc3_)).date + "-" + _loc6_.month + "-" + _loc6_.fullYear + " " + _loc6_.hours + ":" + _loc6_.minutes;
         var _loc7_:Number = _loc9_.getTime();
         var _loc4_:Number = _loc5_ * 60 * 1000;
         _loc7_ += _loc4_;
         var_1236 = new Date(_loc7_);
         var_415 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get adId() : int
      {
         return var_1287;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_686;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_1035;
      }
      
      public function get flatId() : int
      {
         return _flatId;
      }
      
      public function get categoryId() : int
      {
         return var_415;
      }
      
      public function get eventType() : int
      {
         return var_809;
      }
      
      public function get eventName() : String
      {
         return var_1091;
      }
      
      public function get eventDescription() : String
      {
         return var_1285;
      }
      
      public function get creationTime() : String
      {
         return _creationTime;
      }
      
      public function get expirationDate() : Date
      {
         return var_1236;
      }
   }
}
