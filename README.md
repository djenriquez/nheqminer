# nheqminer
Dockerized nheqminer

# Summary
Dockerizes the nheqminer binary. Run the docker container as if it were the actual binary, simply pass in flags.

# Run
```
$: docker run --rm -t \
--runtime=nvidia \
djenriquez/nheqminer

	==================== www.nicehash.com ====================
		Equihash CPU&GPU Miner for NiceHash v0.5c
	Thanks to Zcash developers for providing base of the code.
	    Special thanks to tromp, xenoncat and djeZo for providing 
	      optimized CPU and CUDA equihash solvers.
	==================== www.nicehash.com ====================

Parameters: 
	-h		Print this help and quit
	-l [location]	Stratum server:port
	-u [username]	Username (bitcoinaddress)
	-a [port]	Local API port (default: 0 = do not bind)
	-d [level]	Debug print level (0 = print all, 5 = fatal only, default: 2)
	-b [hashes]	Run in benchmark mode (default: 200 iterations)

CPU settings
	-t [num_thrds]	Number of CPU threads
	-e [ext]	Force CPU ext (0 = SSE2, 1 = AVX, 2 = AVX2)

NVIDIA CUDA settings
	-ci		CUDA info
	-cv [ver]	Set CUDA solver (0 = djeZo, 1 = tromp)
	-cd [devices]	Enable CUDA mining on spec. devices
	-cb [blocks]	Number of blocks
	-ct [tpb]	Number of threads per block
Example: -cd 0 2 -cb 12 16 -ct 64 128
$: 

```

## Example
```
docker run -d -t \
--name nheqminer \
--restart always \
--runtime=nvidia \
djenriquez/nheqminer \
-l zcl.suprnova.cc:4042 -u t1WsdsfAzbxUXPgVhT63nm62q97divGgp1s -p x
```

# Dependencies
- nvidia GPUs
- CUDA drivers for your machine, see https://developer.nvidia.com/cuda-downloads?target_os=Linux
- [nvidia-docker](https://github.com/NVIDIA/nvidia-docker)