<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    //
    public function commentPage($post_id){
        // return $post_id;
        $comments = Comment::where('post_id',$post_id)->get();
       $post= Post::find($post_id);
        return view ('Comment.comment_page',compact('post','comments'));
    }//
    public function commentEditPage($id){
        // return $post_id;
        $comment = Comment::where('id',$id)->first();
        // return $comment;
        return view ('Comment.comment_edit_page',compact('comment'));
    }//
    
    public function commentStore(Request $request){
          $request->validate([
            "comment"=> "required|min:1",
            
        ]);
        $user = session()->get('user');
        Comment::create([ 
            "comment"=>$request->comment,
            "user_id"=>$user->id,
            "post_id"=>$request->post_id
        ]);
        $notification = array(
            'message'=>"Ment Successfully",
            'alert-type'=>'success'
        );
        return redirect()->route('dashboard')->with($notification); 
    }//

    public function commentDelete($id){
        $user = session()->get('user');
        Comment::where('id',$id)
              ->where('user_id',$user->id)
              ->delete();
              $notification = array(
                'message'=>"Deleted Successfully",
                'alert-type'=>'success'
            );
            return redirect()->back()->with($notification);  
    }//
    public function commentUpdate(Request $request){
        $request->validate([
          "comment"=> "required|min:1",
          
      ]);
     
      Comment::where('id',$request->comment_id) 
            ->update([ 
          "comment"=>$request->comment
         
      ]);
      $notification = array(
          'message'=>"Ment Updated Successfully",
          'alert-type'=>'success'
      );
      return redirect()->back()->with($notification); 
  }//

}
