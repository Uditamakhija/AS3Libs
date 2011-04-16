﻿package  {			import com.gskinner.geom.ColorMatrix;	import flash.filters.ColorMatrixFilter;	import flash.display.Sprite;	import flash.events.Event;	import flash.events.MouseEvent;	import fl.controls.Button;	import fl.controls.NumericStepper;		public class ColorMatrixDemo extends Sprite {			// Public Properties:		public var resetButton:Button;		public var brightnessStepper:NumericStepper;		public var contrastStepper:NumericStepper;		public var saturationStepper:NumericStepper;		public var hueStepper:NumericStepper;			// Protected Properties:		protected var colorMatrix:ColorMatrix;		protected var colorMatrixFilter:ColorMatrixFilter;			// Initialization:		public function ColorMatrixDemo() {			resetButton.addEventListener(MouseEvent.CLICK, onReset, false, 0, true);			brightnessStepper.addEventListener(Event.CHANGE, handleChange, false, 0, true);			contrastStepper.addEventListener(Event.CHANGE, handleChange, false, 0, true);			saturationStepper.addEventListener(Event.CHANGE, handleChange, false, 0, true);			hueStepper.addEventListener(Event.CHANGE, handleChange, false, 0, true);						colorMatrix = new ColorMatrix();			colorMatrixFilter = new ColorMatrixFilter(colorMatrix);		}			// Protected Methods:		protected function handleChange(e:Event) {			update();		}				protected function onReset(e:MouseEvent) {			brightnessStepper.value = contrastStepper.value = saturationStepper.value = hueStepper.value = 0;			update();		}				protected function update() {			colorMatrix.reset();			colorMatrix.adjustColor(brightnessStepper.value, contrastStepper.value, saturationStepper.value, hueStepper.value);			colorMatrixFilter.matrix = colorMatrix;			clip.filters = [colorMatrixFilter];		}			}	}