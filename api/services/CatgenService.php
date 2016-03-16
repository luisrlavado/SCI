<?php

class CatgenService{

    public function listar(){

      $catgen=Catgen::find();

      if(count($catgen->toArray())==0){
            return array("status" => 404, "mensaje" => "No hay registros de configuración de bienes");
      }else{
          foreach($catgen as $cgb){
               $catgen[]=array(
                "id" => $cgb->id,
                "codigo" => $cgb->codigo,
                "descripcion" => $cgb->descripcion,
                "tipo" => $cgb->tipo
                );
            }
      }
        return array("status" => 200, "mensaje" =>$users);
    }

        public function nuevo($cgb){
            $catgen=new Catgen();

            $data=array(
                "id" => $cgb->id,
                "codigo" => $cgb->codigo,
                "descripcion" => $cgb->descripcion,
                "tipo" => $cgb->tipo
                );

            if($catgen->save($data)){
                    return array("status" => 201, "mensaje" => $data);
            }else{
                $errors = array();
                foreach ($catgen->getMessages() as $message) {
                    $errors[] = $message->getMessage();
                }
                return array("status" => 400, "mensaje" =>$errors);
            }
        }

        public function modificar($id,$us){
            $modificar=Catgen::find($id);
            if(count($modificar)>0){
                if(isset($us->pass) && $us->pass !== '' && $us->pass !== null && $us->pass !== 'undefined'){
                    $pass = sha1($us->pass);
                }else{
                    $pass = $modificar[0]->pass;
                }
                $data=array(     
                "codigo" => $cgb->codigo,
                "descripcion" => $cgb->descripcion,
                "tipo" => $cgb->tipo
                );

                if($modificar->update($data)){
                        unset($data['pass']);
                        return array("status" => 200, "mensaje" => $data);
                }
                else{
                     $errors = array();
                    foreach ($catgen->getMessages() as $message) {
                        $errors[] = $message->getMessage();
                    }
                    return array("status" => 400, "mensaje" =>$errors);
                }
            }else{
                return array("status" => 404, "mensaje" =>"El registro que intenta modificar no existe");
            }
        }

        public function eliminar($id){
            $catgen=Catgen::find($id);
            if(count($catgen)){
                $catgen->delete();
                return array("status" => 200, "mensaje" => 'Configuración Eliminada');
            }else{
                return array("status"=>404, "mensaje"=> "El registro intenta modificar no existe");
            }
       }




}
?>