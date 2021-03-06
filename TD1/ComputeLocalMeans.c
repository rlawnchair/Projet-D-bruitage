#include "mex.h"
#include "matrix.h"
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) {
   
    if(nrhs != 2){
        mexPrintf("Invalid arguments number\nUsage : ComputeLocalMeans(img, neighborhoodSize)\n");
        return;
    }
    
    /* Déclarations */
    mxArray *data;
    double *input, *output;
    int ndims;
    const int *dims;
    int imgSize;
    int v; /* size of neighborhoods */
    
    /* Copy input pointer */
    input = (double*)mxGetPr(prhs[0]);
    ndims = mxGetNumberOfDimensions(prhs[0]);
    dims = mxGetDimensions(prhs[0]);
    imgSize = dims[0]*dims[1]*dims[2];
    
    /* Copy input parameters */
    v = (int)(mxGetScalar(prhs[1]));
    
    
    /* Allocate memory and assign output pointer */
    plhs[0] = mxCreateNumericArray(ndims, dims, mxDOUBLE_CLASS, mxREAL);
    
    /* Get a pointer to the data space in our newly allocated memory */
    output = (double*)mxGetPr(plhs[0]);
    
    int i, j, k, x, y, z, idx, cpt;
    double sum;
    for(i = 0; i < dims[0]; ++i){
        for(j = 0; j < dims[1]; ++j){
            for(k = 0; k < dims[2]; ++k){
                sum = 0;
                cpt = 0;
                for(x = -v; x <= v; ++x) 
                    for(y = -v; y <= v; ++y)
                        for(z = -v; z <= v; ++z){
                            idx = (i+x) + (j+y)*dims[0] + (k+z)*dims[0]*dims[1];
                            if(idx >= 0 && idx < imgSize){
                                sum += input[idx];
                                cpt++;
                            }
                        }
                output[i + j*dims[0] + k*dims[0]*dims[1]] = sum/cpt;
            }
        }
    }
    return ;
}
