package {
	
	
	import openfl.display.Sprite;
	import openfl.display.Stage;
	import openfl.events.AsyncErrorEvent;
	import openfl.media.Video;
	import openfl.net.NetConnection;
	import openfl.net.NetStream;
	
	
	public class App extends Sprite {
		
		
		private var netStream:NetStream;
		private var video:Video;
		
		
		public function App () {
			
			super ();
			
			video = new Video ();
			addChild (video);
			
			var netConnection:NetConnection = new NetConnection ();
			netConnection.connect (null);
			
			netStream = new NetStream (netConnection);
			netStream.client = { onMetaData: client_onMetaData };
			netStream.addEventListener (AsyncErrorEvent.ASYNC_ERROR, netStream_onAsyncError); 
			netStream.play ("assets/example.mp4");
			
		}
		
		
		private function client_onMetaData (metaData:Object):void {
			
			video.attachNetStream (netStream);
			
			video.width = video.videoWidth;
			video.height = video.videoHeight;
			
		}
		
		
		private function netStream_onAsyncError (event:AsyncErrorEvent):void {
			
			trace ("Error loading video");
			
		}
		
		
	}
	
	
}