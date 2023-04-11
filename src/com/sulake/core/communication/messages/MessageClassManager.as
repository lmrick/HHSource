package com.sulake.core.communication.messages
{
   import com.sulake.core.utils.ClassUtils;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;

   public class MessageClassManager
   {
       
      
      private var var_3334:Dictionary;
      
      private var var_3137:Dictionary;
      
      private var var_2191:Dictionary;
      
      public function MessageClassManager()
      {
         var_3334 = new Dictionary();
         var_3137 = new Dictionary();
         var_2191 = new Dictionary();
         super();
      }
      
      public function dispose() : void
      {
         var _loc1_:IMessageEvent = null;
         if(var_2191)
         {
            for each(var _loc2_ in var_2191)
            {
               _loc1_ = var_2191[_loc2_];
               if(_loc1_)
               {
                  _loc1_.dispose();
               }
            }
         }
      }
      
      public function registerMessages(param1:IMessageConfiguration) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in param1.events)
         {
            registerMessageEventClass(parseInt(_loc2_),param1.events[_loc2_]);
         }
         for(_loc2_ in param1.composers)
         {
            registerMessageComposerClass(parseInt(_loc2_),param1.composers[_loc2_]);
         }
      }
      
      private function registerMessageComposerClass(param1:int, param2:Class) : void
      {
         if(!ClassUtils.implementsInterface(param2,IMessageComposer))
         {
            throw new Error("Invalid composer class for message ID " + param1);
         }
         var _loc3_:String = getQualifiedClassName(param2);
         if(false)
         {
            throw new Error("Duplicate message ID definition for composer class " + _loc3_);
         }
         var_3334[_loc3_] = param1;
      }
      
      private function registerMessageEventClass(param1:int, param2:Class) : void
      {
         if(!ClassUtils.implementsInterface(param2,IMessageEvent))
         {
            throw new Error("Invalid event class for message ID " + param1);
         }
         var _loc3_:String = getQualifiedClassName(param2);
         if(false)
         {
            throw new Error("Duplicate message ID definition for event class " + _loc3_);
         }
         var_3137[_loc3_] = param1;
      }
      
      public function registerMessageEvent(param1:IMessageEvent) : void
      {
         var _loc4_:String = getQualifiedClassName(param1);
         var _loc2_:Object = var_3137[_loc4_];
         if(_loc2_ == null)
         {
            throw new Error("Unknown message event class " + _loc4_);
         }
         var _loc3_:* = var_2191[_loc2_];
         if(_loc3_ != null)
         {
            param1.parser = (_loc3_[0] as IMessageEvent).parser;
         }
         else
         {
            _loc3_ = [];
            var_2191[_loc2_] = _loc3_;
            param1.parser = new param1.parserClass();
         }
         _loc3_.push(param1);
      }
      
      public function unregisterMessageEvent(param1:IMessageEvent) : void
      {
         var _loc5_:String = getQualifiedClassName(param1);
         var _loc2_:Object = var_3137[_loc5_];
         if(_loc2_ == null)
         {
            return;
         }
         var _loc4_:Array;
         if((_loc4_ = var_2191[_loc2_]) == null)
         {
            return;
         }
         var _loc3_:int = _loc4_.indexOf(param1);
         if(_loc3_ >= 0)
         {
            _loc4_.splice(_loc3_,1);
            if(_loc4_.length == 0)
            {
               delete var_2191[_loc2_];
            }
         }
      }
      
      public function getMessageIDForComposer(param1:IMessageComposer) : int
      {
         var _loc2_:Object = var_3334[getQualifiedClassName(param1)];
         if(_loc2_ == null)
         {
            return -1;
         }
         return int(_loc2_);
      }
      
      public function getMessageEventsForID(param1:int) : Array
      {
         return var_2191[param1];
      }
   }
}
