<?php

namespace App\Controllers;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Services\TeamsService;


class TeamsController
{
	/**
	 * 	
	 * @var TeamsService
	 */
    protected $teamsService;

    public function __construct($service)
    {
        $this->teamsService = $service;
    }


    
    public function findOneByName($name)
    {
    	return new JsonResponse($this->teamsService->findOneByName($name));
    }

    public function findByTechnoCode($code)
    {
    	return new JsonResponse($this->teamsService->findByTechnoCode($code));
    }
    
    /**
     * Retourne la liste des equipes proches d'une premiere equipe
     * @param string $name
     * @return \Symfony\Component\HttpFoundation\JsonResponse
     */
    public function findByProximityByName($name)
    {
    	return new JsonResponse($this->teamsService->findProximitiesByName($name));
    }
    
    
    public function save(Request $request)
    {

        $person = $this->getDataFromRequest($request);
        return new JsonResponse(array("id" => $this->teamsService->save($person)));

    }

    public function update($id, Request $request)
    {
        $note = $this->getDataFromRequest($request);
        $this->teamsService->update($id, $note);
        return new JsonResponse($note);

    }

    public function delete($id)
    {

        return new JsonResponse($this->teamsService->delete($id));

    }

    public function getDataFromRequest(Request $request)
    {
        return array(
            "note" => $request->request->get("person")
        );
    }
}
