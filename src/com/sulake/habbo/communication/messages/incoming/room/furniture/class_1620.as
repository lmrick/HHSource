package package_25
{
   [SecureSWF(rename="true")]
   public class class_1620
   {
       
      
      private var var_247:int = 0;
      
      private var var_271:int = 0;
      
      private var _color:uint = 0;
      
      private var var_1063:uint = 0;
      
      private var var_25:Boolean = false;
      
      public function class_1620(param1:int)
      {
         super();
         var_247 = param1;
      }
      
      public function setReadOnly() : void
      {
         var_25 = true;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_25)
         {
            var_271 = param1;
         }
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function set color(param1:uint) : void
      {
         if(!var_25)
         {
            _color = param1;
         }
      }
      
      public function get light() : int
      {
         return var_1063;
      }
      
      public function set light(param1:int) : void
      {
         if(!var_25)
         {
            var_1063 = param1;
         }
      }
   }
}
