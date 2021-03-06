<?php

namespace App;

use Silex\Application;

class RoutesLoader
{
    private $app;

    public function __construct(Application $app)
    {
        $this->app = $app;
        $this->instantiateControllers();

    }

    private function instantiateControllers()
    {
        //PEOPLE 
    	$this->app['people.controller'] = $this->app->share(function () {
            return new Controllers\PeopleController($this->app['people.service']);
        });
    	
    	//TEAMS
        $this->app['teams.controller'] = $this->app->share(function () {
      		return new Controllers\TeamsController($this->app['teams.service']);
       	});
        
        //TECHNOS 
       	$this->app['technos.controller'] = $this->app->share(function () {
       		return new Controllers\TechnosController($this->app['technos.service']);
       	});

        //EVENTS
        $this->app['events.controller'] = $this->app->share(function () {
            return new Controllers\EventsController($this->app['events.service'], $this->app['teams.service'], $this->app['technos.service']);
        });

       	//SEARCH
       	$this->app['search.controller'] = $this->app->share(function () {
       		return new Controllers\SearchController($this->app['search.service']);
       	});
    }

    public function bindRoutesToControllers()
    {
        $api = $this->app["controllers_factory"];

        /**
         * PEOPLE
         */
        // rechercher personne by username
        $api->get('/people'			, "people.controller:findAllOrderByNameLastname");
        // rechercher personne by username
        $api->get('/people/{username}'			, "people.controller:findOneByUsername");
        // rechercher les personnes d'une team particuliere
        $api->get('/teams/{id}/people'	, "people.controller:findByTeamId")->assert('id', '\d+');
        $api->get('/teams/{name}/people'	, "people.controller:findByTeamName");        
        // rechercher les personnes associées à une techno
        $api->get('/technos/{code}/people'		, "people.controller:findByTechnoCode");
        // update une description
        $api->post('/people/{id}/description'   , "people.controller:updateDescription");
        
        /**
         * TEAMS
         */
        // rechercher une team par son nom
        $api->get('/teams/{id}'			, "teams.controller:findOneById")->assert('id', '\d+');
        $api->get('/teams/{name}'			, "teams.controller:findOneByName") ;
        // rechercher les equipes associées à une techno
        $api->get('/technos/{code}/teams'		, "teams.controller:findByTechnoCode");
        // recherche les equipes proches d'une autre equipe
        $api->get('/teams/{teamid}/proximity/teams', "teams.controller:findByProximityById")->assert('teamid', '\d+');

        
        // Ajouter techno a une equipe
        $api->put('/teams/{id}/technos', "teams.controller:addTechnoByTechnoId");
        $api->put('/teams/{id}/technos/{techno_id}', "teams.controller:addTechnoByTechnoId2");
        
        // Retirer techno a une equipe
        $api->delete('/teams/{id}/technos/{techno_id}', 'teams.controller:removeTechnoByTechnoId') ;
        
        /**
         * TECHNO - ASSETS
         */
        // rechercher une techno par son nom
        $api->get('/technos/{code}'				, "technos.controller:findOneByCode");
        // rechercher les technos d'une team particuliere
        $api->get('/teams/{id}/technos'	, "technos.controller:findByTeamId")->assert('id', '\d+');
        $api->get('/teams/{name}/technos'	, "technos.controller:findByTeamName");
        // rechercher les technos d'une personne particuliere
        $api->get('/people/{username}/technos'	, "technos.controller:findByPeopleUsername");  
        // recherche les technos d'une équipe utilisé par un de ses membres.
        $api->get('/teams/{name}/peoples/{username}/technos'	, "technos.controller:findByTeamByUsername");
        // recherche tous les technos present
        $api->get('/technos'    , "technos.controller:getTechnos");

        /**
        * EVENTS 
        */
        //PUT a new event
        $api->get('/teams/{teamid}/events', "events.controller:getEvents")->assert('teamid', '\d+');
        $api->put('/events', "events.controller:createEvent"); 
        $api->get('/deleteevents', "events.controller:deleteEvents");
        
        /**
         * SEARCH
         */
        $api->get('/search','search.controller:findTechnosTeamsPeopleByTerm') ;
/*
        $api->post('/notes', "notes.controller:save");
        $api->post('/notes/{id}', "notes.controller:update");
        $api->delete('/notes/{id}', "notes.controller:delete");
*/
        $this->app->mount($this->app["api.endpoint"].'/'.$this->app["api.version"], $api);
    }
}

