package com.sulake.habbo.ui.widget.poll
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetPollMessage;
   import com.sulake.habbo.window.utils.class_3132;
   import package_158.class_1558;
   import package_158.class_1579;
   
   public class PollContentDialog implements class_3419
   {
       
      
      private var var_247:int = -1;
      
      private var _disposed:Boolean = false;
      
      private var _window:class_3281;
      
      private var var_1429:com.sulake.habbo.ui.widget.poll.PollWidget;
      
      private var var_1763:class_3281;
      
      private var var_4070:Boolean = false;
      
      private var var_2219:Array;
      
      private var _question:int = -1;
      
      private var var_3149:int = 0;
      
      private var var_2949:int = -1;
      
      private var var_901:Boolean = false;
      
      private var var_2604:int = 0;
      
      private var _currentQuestion:class_1558 = null;
      
      public function PollContentDialog(param1:int, param2:String, param3:Array, param4:com.sulake.habbo.ui.widget.poll.PollWidget, param5:Boolean)
      {
         var _loc8_:ITextWindow = null;
         var _loc7_:class_3127 = null;
         var _loc9_:class_3127 = null;
         var _loc6_:class_3127 = null;
         super();
         var_247 = param1;
         var_2219 = param3;
         var_1429 = param4;
         var_901 = param5;
         answerableQuestionCount();
         var _loc10_:XmlAsset;
         if((_loc10_ = var_1429.assets.getAssetByName("poll_question") as XmlAsset) != null)
         {
            _window = var_1429.windowManager.buildFromXML(_loc10_.content as XML) as class_3281;
            if(_loc8_ = _window.findChildByName("poll_question_headline") as ITextWindow)
            {
               _loc8_.text = param2;
            }
            _window.center();
            if((_loc7_ = _window.findChildByName("header_button_close")) != null)
            {
               _loc7_.addEventListener("WME_CLICK",onClose);
            }
            if((_loc9_ = _window.findChildByName("poll_question_button_ok")) != null)
            {
               _loc9_.addEventListener("WME_CLICK",onOk);
            }
            if((_loc6_ = _window.findChildByName("poll_question_cancel")) != null)
            {
               _loc6_.addEventListener("WME_CLICK",onCancel);
            }
         }
      }
      
      public function start() : void
      {
         if(!var_4070)
         {
            var_4070 = true;
            nextQuestion();
         }
      }
      
      private function onClose(param1:class_3134) : void
      {
         showCancelConfirm();
      }
      
      private function onOk(param1:class_3134) : void
      {
         answerPollQuestion();
      }
      
      private function onCancel(param1:class_3134) : void
      {
         showCancelConfirm();
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(var_1763)
         {
            var_1763.dispose();
            var_1763 = null;
         }
         var_1429 = null;
         var_2219 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function nextQuestion() : void
      {
         var _loc5_:ITextWindow = null;
         var _loc1_:class_3151 = null;
         var _loc2_:String = null;
         var _loc4_:IItemListWindow = null;
         var _loc3_:int = 0;
         _currentQuestion = getNextQuestion();
         if(_currentQuestion)
         {
            if(_window != null)
            {
               if((_loc5_ = _window.findChildByName("poll_question_text") as ITextWindow) != null)
               {
                  _loc5_.text = _currentQuestion.questionText;
               }
               if((_loc5_ = _window.findChildByName("poll_question_number") as ITextWindow) != null)
               {
                  _loc5_.text = "${poll_question_number}";
                  _loc2_ = _loc5_.text;
                  _loc2_ = _loc2_.replace("%number%",_question + 1);
                  _loc2_ = _loc2_.replace("%count%",var_3149);
                  _loc5_.text = _loc2_;
               }
               _loc1_ = _window.findChildByName("poll_question_answer_container") as class_3151;
               if(_loc1_ != null)
               {
                  while(_loc1_.numChildren > 0)
                  {
                     _loc1_.getChildAt(0).dispose();
                  }
                  _loc1_.invalidate();
               }
               switch(-1)
               {
                  case 0:
                     populateRadionButtonType(_loc1_,_currentQuestion.questionChoices);
                     break;
                  case 1:
                     populateCheckBoxType(_loc1_,_currentQuestion.questionChoices);
                     break;
                  case 2:
                     populateTextLineType(_loc1_);
                     break;
                  case 3:
                     populateTextAreaType(_loc1_);
                     break;
                  default:
                     nextQuestion();
               }
               if((_loc4_ = _window.findChildByName("poll_content_wrapper") as IItemListWindow) != null)
               {
                  _loc3_ = _loc4_.scrollableRegion.height - _loc4_.visibleRegion.height;
                  _window.height += _loc3_;
                  _window.center();
               }
            }
         }
         else
         {
            var_1429.pollFinished(var_247);
         }
      }
      
      private function getNextQuestion() : class_1558
      {
         var _loc1_:class_1558 = null;
         var _loc3_:int = 0;
         var _loc2_:class_1558 = null;
         if(var_901 && var_2949 >= 0 && var_2604 != 0)
         {
            _loc1_ = var_2219[var_2949];
            _loc3_ = 0;
            while(_loc3_ < _loc1_.children.length)
            {
               _loc2_ = _loc1_.children[_loc3_];
               if(_loc2_ && _loc2_.questionCategory == var_2604)
               {
                  var_2949 = -1;
                  return _loc2_;
               }
               _loc3_++;
            }
         }
         _question++;
         if(_question < var_2219.length)
         {
            var_2949 = _question;
            return var_2219[_question];
         }
         return null;
      }
      
      private function populateRadionButtonType(param1:class_3151, param2:Vector.<class_1579>) : void
      {
         var _loc3_:XmlAsset = var_1429.assets.getAssetByName("poll_answer_radiobutton_input") as XmlAsset;
         if(!_loc3_)
         {
            throw new Error("Asset for poll widget hot found: \"poll_answer_radiobutton_input\"!");
         }
         var _loc4_:class_3151;
         if((_loc4_ = var_1429.windowManager.buildFromXML(_loc3_.content as XML) as class_3151) != null)
         {
            populateSelectionList(param2,_loc4_);
            param1.addChild(_loc4_);
         }
      }
      
      private function resolveRadionButtonTypeAnswer(param1:class_1558) : Array
      {
         var _loc3_:ISelectorWindow = null;
         var _loc4_:ISelectableWindow = null;
         var _loc5_:class_1579 = null;
         var _loc2_:* = [];
         if(_window != null)
         {
            _loc3_ = _window.findChildByName("poll_answer_selector") as ISelectorWindow;
            if(_loc3_)
            {
               if(_loc4_ = _loc3_.getSelected())
               {
                  _loc5_ = param1.questionChoices[_loc4_.id];
                  if(var_901)
                  {
                     var_2604 = _loc5_.choiceType;
                  }
                  else
                  {
                     var_2604 = 0;
                  }
                  _loc2_.push(_loc5_.value);
               }
            }
         }
         return _loc2_;
      }
      
      private function populateCheckBoxType(param1:class_3151, param2:Vector.<class_1579>) : void
      {
         var _loc3_:XmlAsset = var_1429.assets.getAssetByName("poll_answer_checkbox_input") as XmlAsset;
         if(!_loc3_)
         {
            throw new Error("Asset for poll widget hot found: \"poll_answer_checkbox_input\"!");
         }
         var _loc4_:class_3151;
         if((_loc4_ = var_1429.windowManager.buildFromXML(_loc3_.content as XML) as class_3151) != null)
         {
            populateSelectionList(param2,_loc4_);
            param1.addChild(_loc4_);
         }
      }
      
      private function resolveCheckBoxTypeAnswer(param1:class_1558) : Array
      {
         var _loc5_:IItemListWindow = null;
         var _loc3_:int = 0;
         var _loc6_:class_3151 = null;
         var _loc4_:class_3176 = null;
         var _loc2_:* = [];
         if(_window != null)
         {
            if((_loc5_ = _window.findChildByName("poll_answer_itemlist") as IItemListWindow) != null)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc5_.numListItems)
               {
                  if((_loc6_ = _loc5_.getListItemAt(_loc3_) as class_3151) != null)
                  {
                     if((_loc4_ = _loc6_.findChildByName("poll_answer_checkbox") as class_3176) != null)
                     {
                        if(_loc4_.testStateFlag(8))
                        {
                           _loc2_.push(param1.questionChoices[_loc3_].value);
                        }
                     }
                  }
                  _loc3_++;
               }
            }
         }
         return _loc2_;
      }
      
      private function populateSelectionList(param1:Vector.<class_1579>, param2:class_3151) : void
      {
         var _loc7_:class_3151 = null;
         var _loc4_:int = 0;
         var _loc5_:ITextWindow = null;
         var _loc3_:class_3127 = null;
         var _loc6_:IItemListWindow;
         if((_loc6_ = param2.findChildByName("poll_answer_itemlist") as IItemListWindow) != null)
         {
            if((_loc7_ = param2.findChildByName("poll_answer_entity") as class_3151) != null)
            {
               _loc4_ = 0;
               while(_loc4_ < param1.length - 1)
               {
                  _loc4_++;
                  _loc6_.addListItem(_loc7_.clone());
               }
               _loc4_ = 0;
               while(_loc4_ < param1.length)
               {
                  if(_loc5_ = (_loc7_ = _loc6_.getListItemAt(_loc4_) as class_3151).findChildByName("poll_answer_entity_text") as ITextWindow)
                  {
                     _loc5_.text = param1[_loc4_].choiceText;
                  }
                  _loc3_ = _loc7_.findChildByTag("POLL_SELECTABLE_ITEM");
                  if(_loc3_)
                  {
                     _loc3_.id = _loc4_;
                  }
                  _loc4_++;
               }
            }
         }
      }
      
      private function populateTextLineType(param1:class_3151) : void
      {
         var _loc2_:XmlAsset = var_1429.assets.getAssetByName("poll_answer_text_input") as XmlAsset;
         if(!_loc2_)
         {
            throw new Error("Asset for poll widget hot found: \"poll_answer_text_input\"!");
         }
         param1.addChild(var_1429.windowManager.buildFromXML(_loc2_.content as XML));
      }
      
      private function resolveTextLineTypeAnswer() : Array
      {
         var _loc2_:ITextWindow = null;
         var _loc1_:* = [];
         if(_window != null)
         {
            _loc2_ = _window.findChildByName("poll_answer_input") as ITextWindow;
            if(_loc2_ != null)
            {
               _loc1_.push(_loc2_.text);
            }
            return _loc1_;
         }
         throw new Error("Invalid or disposed poll dialog!");
      }
      
      private function populateTextAreaType(param1:class_3151) : void
      {
         populateTextLineType(param1);
      }
      
      private function resolveTextAreaTypeAnswer() : Array
      {
         return resolveTextLineTypeAnswer();
      }
      
      private function cancelPoll() : void
      {
         var_1429.pollCancelled(var_247);
      }
      
      private function answerPollQuestion() : void
      {
         var answerArray:Array;
         var answers:Array;
         var message:RoomWidgetPollMessage;
         var answerValue:int;
         var question:class_1558 = null;
         if(var_901 && _currentQuestion)
         {
            question = _currentQuestion;
         }
         else
         {
            question = var_2219[_question];
         }
         var_2604 = 0;
         switch(-1)
         {
            case 0:
               answerArray = resolveRadionButtonTypeAnswer(question);
               break;
            case 1:
               answerArray = resolveCheckBoxTypeAnswer(question);
               if(false)
               {
                  var_1429.windowManager.alert("${win_error}","${poll_alert_answer_missing}",0,function(param1:class_3132, param2:class_3134):void
                  {
                     param1.dispose();
                  });
                  return;
               }
               if(answerArray.length > question.questionChoices.length)
               {
                  var_1429.windowManager.alert("${win_error}","${poll_alert_invalid_selection}",0,function(param1:class_3132, param2:class_3134):void
                  {
                     param1.dispose();
                  });
                  return;
               }
               break;
            case 2:
               answerArray = resolveTextLineTypeAnswer();
               break;
            case 3:
               answerArray = resolveTextAreaTypeAnswer();
               break;
            default:
               throw new Error("Unknown poll question type: undefined!");
         }
         answers = [];
         message = new RoomWidgetPollMessage("RWPM_ANSWER",var_247);
         message.questionId = question.questionId;
         if(question.questionChoices.length > 0)
         {
            for each(answerValue in answerArray)
            {
               answers.push(answerValue);
            }
         }
         else
         {
            answers.push(answerArray);
         }
         message.answers = answers;
         var_1429.messageListener.processWidgetMessage(message);
         nextQuestion();
      }
      
      private function showCancelConfirm() : void
      {
         var _loc4_:XmlAsset = null;
         var _loc2_:class_3127 = null;
         var _loc3_:class_3127 = null;
         var _loc1_:class_3127 = null;
         if(!var_1763)
         {
            _loc4_ = var_1429.assets.getAssetByName("poll_cancel_confirm") as XmlAsset;
            var_1763 = var_1429.windowManager.buildFromXML(_loc4_.content as XML,2) as class_3281;
            var_1763.center();
            _loc2_ = var_1763.findChildByName("header_button_close");
            if(_loc2_ != null)
            {
               _loc2_.addEventListener("WME_CLICK",onCancelPollClose);
            }
            _loc3_ = var_1763.findChildByName("poll_cancel_confirm_button_ok");
            if(_loc3_ != null)
            {
               _loc3_.addEventListener("WME_CLICK",onCancelPollOk);
            }
            _loc1_ = var_1763.findChildByName("poll_cancel_confirm_button_cancel");
            if(_loc1_ != null)
            {
               _loc1_.addEventListener("WME_CLICK",onCancelPollCancel);
            }
         }
      }
      
      private function hideCancelConfirm() : void
      {
         if(var_1763 != null)
         {
            var_1763.dispose();
            var_1763 = null;
         }
      }
      
      private function onCancelPollClose(param1:class_3134) : void
      {
         hideCancelConfirm();
      }
      
      private function onCancelPollOk(param1:class_3134) : void
      {
         hideCancelConfirm();
         cancelPoll();
      }
      
      private function onCancelPollCancel(param1:class_3134) : void
      {
         hideCancelConfirm();
      }
      
      private function answerableQuestionCount() : void
      {
         var_3149 = var_2219.length;
         for each(var _loc1_ in var_2219)
         {
            if(_loc1_.children.length > 0)
            {
               var_3149++;
            }
         }
      }
   }
}
