<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Users;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UsersController extends Controller
{
    public function index(){
        $users = Users::all();
        return response()->json($users);
    }

    public function store(Request $request){
        $user = new Users;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->password = Hash::make($request->password);
        $user->save();
        return response()->json([
            "message" => "User Added."
        ], 201);
    }

    public function show($id){
        $user = Users::where('id',$id)->get();
        if(!empty($user)){
            return response()->json($user);
        }else{
            return response()->json([
                "message" => "User Not Found."
            ], 404);
        }
    }

    public function show_from_email($email){
        $user = Users::where('email',$email)->get();
        if(!empty($user)){
            return response()->json($user);
        }else{
            return response()->json([
                "message" => "User Not Found."
            ], 404);
        }
    }

    public function update(Request $request, $id){
        if (Users::where('id', $id)->exists()) {
            $user = Users::where('id',$id)->get();
            $user->name = is_null($request->name) ? $user->name : $request->name;
            $user->email = is_null($request->email) ? $user->email : $request->email;
            $user->phone = is_null($request->phone) ? $user->phone : $request->phone;
            $user->password = is_null($request->password) ? $user->password : $request->password;
            $user->each->save();
            return response()->json([
                "message" => "User Updated."
            ], 204);
        }else{
            return response()->json([
                "message" => "User Not Found."
            ], 404);
        }
    }

    public function destroy($id){
        if(Users::where('id', $id)->exists()){
            $user = Users::where('id',$id)->get();
            $user->each->delete();
             return response()->json([
                "message" => "User Deleted."
             ], 202);
        }else{
            return response()->json([
                "message" => "User Not Found."
            ], 404);
        }
    }

    public function authenticate(Request $request)
    {
        $credentials = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);

        $email = $request->email;

 
        if (Auth::attempt($credentials)) {
            //$request->session()->regenerate();
            
            $user_details = Users::where('email',$email)->get();

            return response()->json($user_details);
        }else
        {
            return response()->json([
                'email' => 'The provided credentials do not match our records.',
            ], 404);
        }
    }

    public function logout(Request $request)
    {
        Auth::logout();
    
        //$request->session()->invalidate();
    
        //$request->session()->regenerateToken();
    
        return response()->json([
            "STATUS" => "SUCCESS",
            "message" => "Logout Successful",  
        ], 202);
    }
}
