// with guidance from examples at
// http://www.diale.org/javascript3knot.html
// http://davidscottlyons.com/threejs/presentations/frontporch14/#render-loop
// https://threejs.org/examples/webgl_loader_stl.html

var scene, camera, renderer, mesh, plane;
var raf;

init();

function init(){
	scene=new THREE.Scene();
	camera=new THREE.PerspectiveCamera(10, window.innerWidth / window.innerHeight, 1, 100000);
	camera.position.set(500,1000,2000);

	cameraTarget = new THREE.Vector3( 0, 65, 0 );

	renderer=new THREE.WebGLRenderer(); //{ antialias: true }
	renderer.setSize(window.innerWidth, window.innerHeight);
	renderer.shadowMap.enabled = true;
	renderer.shadowMap.type = THREE.PCFSoftShadowMap;

	scene.add( new THREE.HemisphereLight( 0x443333, 0x111122 ) );
	scene.add(new THREE.AmbientLight(0x736F6E));

	var light=new THREE.DirectionalLight( 0xffffff, 1, 100 );
	light.position.set(-1,1,.5);
	light.shadow.mapSize.width = 200;
	light.shadow.mapSize.height = 200;
	light.shadow.camera.near = 0.5;
	light.shadow.camera.far = 500;
	scene.add(light);

	plane = new THREE.Mesh(
		new THREE.PlaneBufferGeometry( 150, 150 ),
		new THREE.MeshPhongMaterial( { color: 0x808080, specular: 0x101010 } )
	);
	plane.rotation.x = -Math.PI/2;
	plane.rotation.z = 0;
	plane.position.y = -0.5;
	plane.castShadow = false;
	plane.receiveShadow = true;
	scene.add( plane );

	document.body.appendChild( renderer.domElement );

	var loader=new THREE.STLLoader();
	loader.load('./eiffel2.stl', function (geometry){
		var material=new THREE.MeshLambertMaterial( { color: 0x448844 } );

		mesh=new THREE.Mesh(geometry, material);
		mesh.rotation.x = -Math.PI/2;
		mesh.rotation.z = 0;
		mesh.castShadow = true;
		mesh.receiveShadow = false;
		
		scene.add(mesh);

		setTimeout(function(){
			cancelAnimationFrame(raf);
			animate();	
		},7000);
		animateTemp();
	});
}

function animateTemp(){
	raf = requestAnimationFrame(animateTemp);
	var timer=Date.now();
	camera.position.z -= Math.pow(10,-12)*timer;
	camera.position.y -= Math.pow(10,-12)*timer
	camera.lookAt(cameraTarget);
	renderer.render(scene, camera);
	renderer.setClearColor(0x808080, 1);
}

function animate(){
	requestAnimationFrame(animate);
	render();
}

function render(){
	var timer=Date.now() * 0.001;
	mesh.rotation.z += (Math.pow(10,-11)*timer)/2;
	plane.rotation.z += (Math.pow(10,-11)*timer)/2;
	camera.lookAt(cameraTarget);
	renderer.render(scene, camera);
	renderer.setClearColor(0x808080, 1);
}
