$(document).ready(function(){

	$('.file').on('change', function(evt){
		
		const files = evt.target.files; // FileList {0: File, 1: File, ...}
		
		let totalSize = 0;
		for(let i=0; i<files.length; i++){
		
			if(files[i].size > 10*1024*1024){
				alert('첨부파일의 최대 크기는 10MB입니다');
				evt.target.value = '';
				return;
			}
			
			totalSize += files[i].size;
		
			if(totalSize > 100*1024*1024){
				alert('전체 첨부파일의 최대 크기는 100MB입니다');
				evt.target.value = '';
				return;
			}
			
		}
		
	})
	
})	
	