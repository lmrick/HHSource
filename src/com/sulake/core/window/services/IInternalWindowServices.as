package com.sulake.core.window.services
{
   public interface IInternalWindowServices
   {
       
      
      function getMouseDraggingService() : IMouseDraggingService;
      
      function getMouseScalingService() : IMouseScalingService;
      
      function getMouseListenerService() : IMouseListenerService;
      
      function getFocusManagerService() : class_3429;
      
      function getToolTipAgentService() : IToolTipAgentService;
      
      function getGestureAgentService() : class_3452;
   }
}
