
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
                            <img src="{{ (!empty($post->user->profile_photo_path)) ? url('upload/admin_images/'.$adminData->profile_photo_path) : url('upload/default_image.png') }}" style="width:40px;height:40px" class="user-img" alt="user avatar">
                        </div>
                        <div class="col">
                            {{-- <a href="{{ route('post.create_page') }}" class="menu-title btn btn-light d-flex align-items-center" style="border: 1px solid rgb(208, 208, 236);">
                                <span style="color:black">What's on your mind?</span>
                            </a> --}}{{$post->user->name}}
                        </div>
                        @if($post->user_id == $adminData->id)

                        <div class="col-1">
                            <div class="">
                               
                                    <i  class="fa-solid fa-ellipsis d-flex align-items-center nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"></i>

                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li><a class="dropdown-item" href="{{route('post.edit',$post->id)}} "><i class="bx bx-user"></i><span>Edit</span></a>
                                    </li>
                                    <li><a class="dropdown-item" href="{{route('post.delete',$post->id)}}"><i class="bx bx-lock"></i><span>Delete</span></a>
                                    
                                    </li>
                                </ul>
                            </div>
                        </div>
                        @else
                        <div class="col-1">
                            <div class="">
                                    
                            </div>
                        </div>
                        @endif
                        
                    </div>
                </div>
                <div class="card-body">
                    <div class="post-content">
                        @php
                            $shortenedPost = substr($post->post, 0, 20);
                            $remainingContent = substr($post->post, 20);
                        @endphp
                    
                        <span class="short-content">{{ $shortenedPost }}</span>
                        <span class="more-content" style="display:none;">{{ $remainingContent }}</span>
                        @if(strlen($post->post) > 20)
                            <a href="#" class="see-more-link">See More</a>
                        @endif
                    </div>

                     @if($post->image)
                    <div class="text-center">
                        <a href="{{asset($post->image)}} ">
                            <img src="{{asset($post->image)}}" style="width:400px;height:300px" class="user-img">
    
                         </a>
                    </div>
                     @else

                     @endif

                </div>

                <div class="card">
                    @foreach ($comments as $comment)
                                   <div class="card">
                                    <div class="card-header">
                                        <div class="row align-items-center">
                                            <div class="col-auto">
                                                <img src="{{ (!empty($comment->user->profile_photo_path)) ? url('upload/admin_images/'.$comment->user->profile_photo_path) : url('upload/default_image.png') }}" style="width:40px;height:40px" class="user-img" alt="user avatar">
                                            </div>
                                            <div class="col">
                                                {{$comment->user->name}}
                                            </div>
                                            @if($comment->user_id == $adminData->id )
                    
                                            <div class="col-1">
                                                <div class="">
                                                   
                                                        <i  class="fa-solid fa-ellipsis d-flex align-items-center nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"></i>
                    
                                                    <ul class="dropdown-menu dropdown-menu-end">
                                                        <li><a class="dropdown-item" href="{{route('comment.edit_page',$comment->id)}} " ><i class="bx bx-user"></i><span>Edit</span></a>
                                                        </li>
                                                        <li><a class="dropdown-item" href="{{route('comment.delete',$comment->id)}}"><i class="bx bx-lock"></i><span>Delete</span></a>
                                                        </li>
                                                            <div class="dropdown-divider mb-0"></div>
                                                        </li>
                                                        {{-- <li><a class="dropdown-item" href="{{route('admin.logout')}} "><i class='bx bx-log-out-circle'></i><span>Logout</span></a> --}}
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                           
                                            @else
                                            <div class="col-1">
                                                <div class="">
                                                    {{-- @if($post->user_id == $comment->user_id) --}}
                                                    {{-- <a class="dropdown-item" href="{{route('comment.delete',$comment->id)}}"><i class="fa-regular fa-circle-xmark"></i></a>  --}}
                                                    {{-- @else --}}
                                                    {{-- @endif --}}
                                                   
                                                    
                                                    {{-- <i class="fa-regular fa-circle-xmark"></i> --}}
                                                </div>
                                            </div>
                                            @endif
                                            
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        {{$comment->comment}} 
                                    </div>

                                    </div>                 
                             
                        
                    @endforeach
                    

                </div>
                <div class="card-footer text-white-100">
                    <div class="">
                        
                            <form action="{{route('comment.store')}} "  method="post" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="post_id" value="{{$post->id}}" >
                                <div class="row col">
                                    <div class="col-8">
                                        <input type="text" id="comment" name="comment" class="form-control" onclick="clearPlaceholderAndEnableButton()()">
                                    </div>
                                    <div class="col-2">
                                        <input type="submit" id="shareButton" class="btn btn-primary px-4" value="Sent" disabled />

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

