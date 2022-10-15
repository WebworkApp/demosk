#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0




# default to using orgpt
ORG=${1:-orgpt}

# Exit on first error, print all commands.
set -e
set -o pipefail

# Where am I?
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

ORDERER_CA=${DIR}/test-network/organizations/ordererOrganizations/demosk.org/tlsca/tlsca.demosk.org-cert.pem
PEER0_ORGPT_CA=${DIR}/test-network/organizations/peerOrganizations/orgpt.demosk.org/tlsca/tlsca.orgpt.demosk.org-cert.pem

if [[ ${ORG,,} == "orgpt" || ${ORG,,} == "digibank" ]]; then

   CORE_PEER_LOCALMSPID=OrgptMSP
   CORE_PEER_MSPCONFIGPATH=${DIR}/test-network/organizations/peerOrganizations/orgpt.demosk.org/users/Admin@orgpt.demosk.org/msp
   CORE_PEER_ADDRESS=localhost:7051
   CORE_PEER_TLS_ROOTCERT_FILE=${DIR}/test-network/organizations/peerOrganizations/orgpt.demosk.org/tlsca/tlsca.orgpt.demosk.org-cert.pem
fi

# output the variables that need to be set
echo "CORE_PEER_TLS_ENABLED=true"
echo "ORDERER_CA=${ORDERER_CA}"
echo "PEER0_ORGPT_CA=${PEER0_ORGPT_CA}"

echo "CORE_PEER_MSPCONFIGPATH=${CORE_PEER_MSPCONFIGPATH}"
echo "CORE_PEER_ADDRESS=${CORE_PEER_ADDRESS}"
echo "CORE_PEER_TLS_ROOTCERT_FILE=${CORE_PEER_TLS_ROOTCERT_FILE}"

echo "CORE_PEER_LOCALMSPID=${CORE_PEER_LOCALMSPID}"
