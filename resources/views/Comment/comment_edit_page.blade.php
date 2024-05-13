
@extends('layouts.admin_master_deshboard')

@section('title','dashboard')

@section('content')
<div class="container">
    @php
    $adminData =App\Models\User::where('id',Auth::user()->id)->first();
    @endphp

    <div class="row flex">
        <div class="col-12 row grid" style="margin-top:20px;">
        <div class="row ">
            
        </div>    
        </div>
    </div>
   
    <div class="row flex">
        <div class="col-12 row grid" style="margin-top:20px;">
            <div class="card col-6 offset-3">
                <div class="card-header">
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <img src="{{ (!empty($comment->user->profile_photo_path)) ? url('upload/admin_images/'.$comment->user->profile_photo_path) : url('upload/default_image.png') }}" style="width:40px;height:40px" class="user-img" alt="user avatar">
                        </div>
                        <div class="col">
                          {{$comment->user->name}}
                        </div>
                       
                        
                    </div>
                </div>
                <div class="card-body">
                    <div class="post-content">
                        @php
                            $shortenedPost = substr($comment->post->post, 0, 20);
                            $remainingContent = substr($comment->post->post, 20);
                        @endphp
                    
                        <span class="short-content">{{ $shortenedPost }}</span>
                        <span class="more-content" style="display:none;">{{ $remainingContent }}</span>
                        @if(strlen($comment->post->post) > 20)
                            <a href="#" class="see-more-link">See More</a>
                        @endif
                    </div>

                     @if($comment->post->image)
                    <div class="text-center">
                        <a href="{{asset($comment->post->image)}} ">
                            <img src="{{asset($comment->post->image)}}" style="width:400px;height:300px" class="user-img">
    
                         </a>
                    </div>
                     @else

                     @endif

                </div>

                <div class="card">
                   
                                   <div class="card">
                                    <div class="card-header">
                                        <div class="row align-items-center">
                                            <div class="col-auto">
                                                <img src="{{ (!empty($comment->user->profile_photo_path)) ? url('upload/admin_images/'.$comment->user->profile_photo_path) : url('upload/default_image.png') }}" style="width:40px;height:40px" class="user-img" alt="user avatar">
                                            </div>
                                            <div class="col">
                                               {{$comment->user->name}}
                                            </div>
                                           
                                            
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        {{$comment->comment}} 
                                    </div>

                                    </div>                 
                             
                        
                   
                    

                </div>
                <div class="card-footer text-white-100">
                    <div class="">
                        
                            <form action="{{route('comment.update')}} "  method="post" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="comment_id" value="{{$comment->id}}" >
                                <div class="row col">
                                    <div class="col-8">
                                        <input type="text" id="comment" value="{{$comment->comment}}" name="comment" class="form-control" onclick="clearPlaceholderAndEnableButton()()">
                                    </div>
                                    <div class="col-2">
                                        <input type="submit" id="shareButton" class="btn btn-primary px-4" value="Update" disabled />
                                    </div>

                                </div>
                            
                            </form>
                        
                       
                    </div>
                   
                  

                </div>
            </div>
        </div>
    </div>
   

   
    
    
   
</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        document.querySelectorAll('.see-more-link').forEach(function(link) {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                var postContent = this.parentElement.querySelector('.more-content');
                var shortContent = this.parentElement.querySelector('.short-content');
                postContent.style.display = 'inline';
                shortContent.style.display = 'none';
                this.style.display = 'none';
            });
        });
    });//
    function clearPlaceholderAndEnableButton() {
        var element = document.getElementById('comment');
        element.placeholder = '';
        var shareButton = document.getElementById('shareButton');
        shareButton.disabled = false;
    }
</script>
@endsection

