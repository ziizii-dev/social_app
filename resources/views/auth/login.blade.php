@extends('layouts.master')

@section('title','Login Page')
@section('content')


<div class="login-form">
    
    <form action="{{route('login')}} " method="post">
        @csrf
        <div class="form-group">
            <label>Email Address</label>
            <input class="au-input au-input--full" type="email" name="email" placeholder="Email" required>
        </div>
        <div class="form-group">
            <label class="text-green-900">Password</label>
            <input class="au-input au-input--full " type="password" name="password" placeholder="Password" required>
        </div>

        <button class="au-btn au-btn--block au-btn--blue t m-b-20" type="submit">sign in</button>

    </form>
    <div class="register-link">
        <p>
            Don't you have account?
            <a href="{{route('auth.registerPage')}} " class="text-green-800">Sign Up Here</a>
        </p>
    </div>
</div>


@endsection
