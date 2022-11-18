<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Auto extends Model
{
    public $incrementing = false;
    protected $primaryKey = 'vin';
    protected $fillable = ['vin','marca','modelo','año','precio'];
}
