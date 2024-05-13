@extends('layouts.admin_master_deshboard')
@section('title','post')

@section('content')
  

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<div class="page-content">
    <!--breadcrumb-->
    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3">Post Create</div>
        <div class="ps-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Post Create </li>
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

                <div class="col-lg-10 offset-1">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title">

                <div class="col-lg-12">
                    {{-- <div class=""></div> --}}
                    <form action="{{route('post.create')}}" method="POST" enctype="multipart/form-data">
                        @csrf
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0 ms-2">Post</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <textarea name="post" class="form-control @error('post') is-invalid
                                    @enderror" id="post" cols="30" rows="10" placeholder="Enter Old Passsword"
                                    onclick="clearPlaceholderAndEnableButton()()">
                                               
                                    </textarea>
                                    @error('post')
                                    <div class="invalid-feedback">
                                        {{$message}}
                                    </div>

                                    @enderror
                                </div>
                               
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0 ms-2">Post Image</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="file" name="image" class="form-control" value=""  id="photo_input" />
                                    <br>
                                    {{-- <input type="file" name="photo" class="form-control-file" id="photo_input"><br> --}}
                     
                                    <img src="" class="float-right" alt="" width="100" height="100"   id="selected_photo">
                                    
                                </div>
                            </div>
                    
                            
                            <div class="row">
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9 text-secondary">
                                    {{-- <input type="submit" class="btn btn-primary px-4" value="Share" disabled /> --}}
                                    <input type="submit" id="shareButton" class="btn btn-primary px-4" value="Share" disabled />
                                </div>
                            </div>
                        </div>
                    </form>

                  
                </div>
                            </div>
                            <hr>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function () {
   
        $('#photo_input').change(function () {
        
            var file = $(this).prop('files')[0];
            console.log(file);

            if (file) {
              
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#selected_photo').attr('src', e.target.result);
                    $('#selected_photo').show();
                };

                reader.readAsDataURL(file);
            } else {
                $('#selected_photo').hide();
            }
        });//
        $('#photo_input_create').change(function () {
        
        var file = $(this).prop('files')[0];
        // console.log(file);

        if (file) {
          
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#selected_photo_create').attr('src', e.target.result);
                $('#selected_photo_create').show();
            };

            reader.readAsDataURL(file);
        } else {
            $('#selected_photo_create').hide();
        }
    });//
    });//
    function clearPlaceholderAndEnableButton() {
        var element = document.getElementById('post');
        element.placeholder = '';
        var shareButton = document.getElementById('shareButton');
        shareButton.disabled = false;
    }
    
</script> 
