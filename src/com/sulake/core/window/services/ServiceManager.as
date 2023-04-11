package com.sulake.core.window.services
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3178;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, class_13
   {
       
      
      private var var_4277:uint;
      
      private var var_464:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_2198:class_3178;
      
      private var var_2880:com.sulake.core.window.services.IMouseDraggingService;
      
      private var var_2752:com.sulake.core.window.services.IMouseScalingService;
      
      private var var_2730:com.sulake.core.window.services.IMouseListenerService;
      
      private var var_2861:com.sulake.core.window.services.class_3429;
      
      private var var_2848:com.sulake.core.window.services.IToolTipAgentService;
      
      private var var_2766:com.sulake.core.window.services.class_3452;
      
      public function ServiceManager(param1:class_3178, param2:DisplayObject)
      {
         super();
         var_4277 = 0;
         var_464 = param2;
         var_2198 = param1;
         var_2880 = new WindowMouseDragger(param2);
         var_2752 = new WindowMouseScaler(param2);
         var_2730 = new WindowMouseListener(param2);
         var_2861 = new FocusManager(param2);
         var_2848 = new WindowToolTipAgent(param2);
         var_2766 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(var_2880 != null)
         {
            var_2880.dispose();
            var_2880 = null;
         }
         if(var_2752 != null)
         {
            var_2752.dispose();
            var_2752 = null;
         }
         if(var_2730 != null)
         {
            var_2730.dispose();
            var_2730 = null;
         }
         if(var_2861 != null)
         {
            var_2861.dispose();
            var_2861 = null;
         }
         if(var_2848 != null)
         {
            var_2848.dispose();
            var_2848 = null;
         }
         if(var_2766 != null)
         {
            var_2766.dispose();
            var_2766 = null;
         }
         var_464 = null;
         var_2198 = null;
         _disposed = true;
      }
      
      public function getMouseDraggingService() : com.sulake.core.window.services.IMouseDraggingService
      {
         return var_2880;
      }
      
      public function getMouseScalingService() : com.sulake.core.window.services.IMouseScalingService
      {
         return var_2752;
      }
      
      public function getMouseListenerService() : com.sulake.core.window.services.IMouseListenerService
      {
         return var_2730;
      }
      
      public function getFocusManagerService() : com.sulake.core.window.services.class_3429
      {
         return var_2861;
      }
      
      public function getToolTipAgentService() : com.sulake.core.window.services.IToolTipAgentService
      {
         return var_2848;
      }
      
      public function getGestureAgentService() : com.sulake.core.window.services.class_3452
      {
         return var_2766;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
   }
}
