#!/bin/sh -xe

proj_dir=$( cd $(dirname $0) ; pwd )
third_party_dir=$proj_dir/third_party

# build libutp
cd $third_party_dir/libutp
make

# build pcc
cd $third_party_dir/pcc/sender
make
cd $third_party_dir/pcc/receiver
make

# build verus
cd $third_party_dir/verus
autoreconf -fi
./configure
make

# build proto-quic
#cd $third_party_dir/proto-quic
#export PATH=$PATH:`pwd`/depot_tools
#cd $third_party_dir/proto-quic/src
#./build/install-build-deps.sh --no-syms --no-arm --no-chromeos-fonts --no-nacl
#gclient runhooks && ninja -C out/Release quic_client quic_server net_unittests
