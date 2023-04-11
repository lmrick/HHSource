package com.sulake.core.communication
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.connection.class_26;
   import com.sulake.core.communication.connection.class_3133;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.class_41;

   public class CoreCommunicationManager extends class_20 implements class_46, class_41
   {
       
      
      private var var_2330:Array;
      
      public function class_1687(param1:class_31, param2:uint = 0)
      {
         super(param1,param2);
         var_2330 = [];
         registerUpdateReceiver(this,0);
      }
      
      override public function dispose() : void
      {
         removeUpdateReceiver(this);
         for each(var _loc1_ in var_2330)
         {
            _loc1_.dispose();
         }
         var_2330 = null;
         super.dispose();
      }
      
      public function createConnection(param1:class_26 = null) : IConnection
      {
         var _loc2_:IConnection = new class_3133(this,param1);
         var_2330.push(_loc2_);
         return _loc2_;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         var _loc3_:IConnection = null;
         _loc2_ = 0;
         while(_loc2_ < var_2330.length)
         {
            _loc3_ = var_2330[_loc2_];
            _loc3_.processReceivedData();
            if(disposed)
            {
               return;
            }
            if(_loc3_.disposed)
            {
               var_2330.splice(_loc2_,1);
            }
            else
            {
               _loc2_++;
            }
         }
      }
   }
}
