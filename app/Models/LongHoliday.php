<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LongHoliday extends Model
{
    use HasFactory;
    protected $guarded=[];
    public function clinic(){
        return $this->belongsTo(Clinic::class,'clinic_id');
    }
}
