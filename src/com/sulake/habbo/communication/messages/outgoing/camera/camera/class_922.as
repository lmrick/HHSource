package com.sulake.habbo.communication.messages.outgoing.camera
{
   import com.sulake.core.communication.messages.IMessageComposer;
   

   public class class_922 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_922()
      {
         var_45 = [];
         super();
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
      
      public function dispose() : void
      {
         var_45 = [];
      }
   }
}
