<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Comment;
use Illuminate\Http\Request;
use App\Http\Requests\PostRequest;
use Intervention\Image\Facades\Image;

class PostController extends Controller
{
    //
    public function postPage(){
        return view('Post.post_page');
    }
    public function postCreate(PostRequest $request){
        // return $request;
        $validator=$request->validated();
    $user = session()->get('user');
    // dd($user);
    // return $user->id;
    $photo = $request->file('image');
    // return $photo;
       if($photo){
        $name_gen = hexdec(uniqid()).'.'.$photo->getClientOriginalExtension();
      
        $photo->move(public_path('upload/post'),$name_gen);

        $save_url = 'upload/post/'.$name_gen;
       
        $post = array_merge($validator, [
            'image' => $save_url,
            'user_id' => $user->id,    
        ]);
        Post::create($post);
        $notification = array(
            'message'=>"Created Successfully",
            'alert-type'=>'success'
        );
        return redirect()->route('dashboard')->with($notification); 
      
       }else{
        $post = array_merge($validator, [
            'user_id' => $user->id,    
        ]);
        Post::create($post);
        $notification = array(
                'message'=>"Created Successfully",
                'alert-type'=>'success'
            );
            return redirect()->route('dashboard')->with($notification);  
       }
    }//

    public function postDelete($id){
        $user = session()->get('user');
        $post= Post::find($id);
         Comment::where('post_id',$post->id)->delete();
        Post::where('id',$id)
              ->where('user_id',$user->id)
              ->delete();

              $notification = array(
                'message'=>"Deleted Successfully",
                'alert-type'=>'success'
            );
            return redirect()->back()->with($notification);  
    }//
    public function postEditPage($id){
        $post=Post::find($id);
        return view ('Post.post_edit_page',compact('post'));
    }//
    public function postUpdate(PostRequest $request){
        $validator=$request->validated();
        $user = session()->get('user');
        
        $photo = $request->file('image');

        if($photo){
            $name_gen = hexdec(uniqid()).'.'.$photo->getClientOriginalExtension();
          
            $photo->move(public_path('upload/post'),$name_gen);
    
            $save_url = 'upload/post/'.$name_gen;
           
            $post = array_merge($validator, [
                'image' => $save_url,
                  
            ]);
          Post::where('id',$request->id)
             ->where('user_id',$user->id)
             ->update($post);
            $notification = array(
                'message'=>"Updated Successfully",
                'alert-type'=>'success'
            );
            return redirect()->route('dashboard')->with($notification); 
          
           }else{
            Post::where('id',$request->id)
             ->where('user_id',$user->id)
             ->update($validator);
            $notification = array(
                    'message'=>"Updated Successfully",
                    'alert-type'=>'success'
                );
                return redirect()->route('dashboard')->with($notification);  
           }

    }

}
