<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class CorreoContrasena extends Mailable
{
    use Queueable, SerializesModels;

    public $usuario;
    public $url;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($usuario, $link)
    {
        $this->usuario = $usuario;
        $this->url = $link;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('mail.solicitud_pedido')->subject("Recuperción de contraseña");
    }
}
