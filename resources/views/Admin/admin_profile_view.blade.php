@extends('layouts.admin_master_deshboard')
@section('title','dashboard')

@section('content')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <div class="page-content">
        <!--breadcrumb-->
        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
            <div class="breadcrumb-title pe-3">Admin User Profile</div>
            <div class="ps-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 p-0">
                        <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Admin Profile</li>
                    </ol>
                </nav>
            </div>
            <div class="ms-auto">

            </div>
        </div>
        <!--end breadcrumb-->
        <div class="container">
            <div class="main-body">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="{{ !empty($adminData->profile_photo_path) ? url('upload/admin_images/' . $adminData->profile_photo_path) : url('upload/no_image.jpg') }}"
                                        alt="Admin" class="rounded-circle p-1 bg-primary" width="110">
                                    <div class="mt-3">
                                        <h4>{{ $adminData->name }} </h4>
                                        <p class="text-secondary mb-1">{{ $adminData->email }}</p>
                                        <p class="text-muted font-size-sm">{{ $adminData->address }}</p>
                                        {{-- <button class="btn btn-primary">Follow</button> --}}
                                        {{-- <button class="btn btn-outline-primary">Message</button> --}}
                                    </div>
                                </div>
                                <hr class="my-4" />
                                <ul class="list-group list-group-flush">
                                    



                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card">
                            <form action="{{ route('admin.profileStore') }}" method="POST" enctype="multipart/form-data">
                                @csrf
                                <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">User Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" class="form-control" value="{{ $adminData->username }} "
                                                disabled />
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" name="name"
                                                class="form-control @error('name') is-invalid
                                        @enderror "
                                                value="{{ $adminData->name }}" />
                                            @error('name')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="email" name="email"
                                                class="form-control @error('email') is-invalid
                                        @enderror "
                                                value="{{ $adminData->email }}" />
                                            @error('email')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" name="phone"
                                                class="form-control @error('phone') is-invalid
                                        @enderror "
                                                value="{{ $adminData->phone }}" />
                                            @error('phone')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" name="address"
                                                class="form-control @error('address') is-invalid
                                        @enderror "
                                                value="{{ $adminData->address }}" />
                                            @error('address')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Photo</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="file" name="photo"
                                                class="form-control @error('photo') is-invalid
                                        @enderror "
                                                id="image" value="" />
                                            @error('photo')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            {{-- <h6 class="mb-0">Photo</h6> --}}
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <img id="showImage"
                                                src="{{ !empty($adminData->profile_photo_path) ? url('upload/admin_images/' . $adminData->profile_photo_path) : url('upload/default_image.png') }}"
                                                alt="Admin" style="width:100px;height:100px">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3"></div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="submit" class="btn btn-primary px-4" value="Save Changes" />
                                        </div>
                                    </div>
                                </div>
                            </form>

                        </div>

                       


                    </div>
                </div>
                @foreach($posts as $post)
                <div class="row flex">
                    <div class="col-12 row grid" style="margin-top:20px;">
                        <div class="card col-6 offset-3">
                            <div class="card-header">
                                <div class="row align-items-center">
                                    <div class="col-auto">
                                        <img src="{{ (!empty($post->user->profile_photo_path)) ? url('upload/admin_images/'.$post->user->profile_photo_path) : url('upload/default_image.png') }}" style="width:40px;height:40px" class="user-img" alt="user avatar">
                                    </div>
                                    <div class="col">
                                       {{$post->user->name}}
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
                                           
                                                {{-- <i  class="fa-solid fa-ellipsis d-flex align-items-center nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"></i> --}}
            
                                            
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
                            <div class="card-footer text-white-100">
                               <a href="{{route('comment.page',$post->id)}} ">
                                <i class="fa-solid fa-comments"></i> 
                                @php
                                $commentCount = 0;
                               @endphp
                            
                            @foreach($comments as $comment)
                                @if($comment->post_id == $post->id)
                                    @php
                                        $commentCount++;
                                    @endphp
                                @endif
                            @endforeach
                            
                              {{ $commentCount }}:Comments
                               </a>
                            </div>
                        </div>
                    </div>
                </div>
                 @endforeach
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#image').change(function(run) {
                var reader = new FileReader();
                reader.onload = function(run) {
                    $('#showImage').attr('src', run.target.result);

                }
                reader.readAsDataURL(run.target.files['0'])
            });
        });
    </script>
@endsection
