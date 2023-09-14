/*
    water
*/

return shader_pixel_create_base64("
    eJxlkj9oE1Ecxz/v3R09pHCzKBhwsUsgkQoZ2tB2EWkHrUcdhBKbBAOxVy5xf90L
    zao4vIJTumRwFAvO6ebmeqObuye/965JxQcHv++f3+/33u93Spfln/IZOy+3tu8D
    vwGlyzICBKPgF2CAAC2QM+GBT45TjvtccV8A7dP4WnFzx3nfj4orHKf/4fY6x4N+
    NuxyeXkZsuoyRJdz0Bn3cv7nj7Jhlo8zlLuJfP50B6Nxlo8rzveRM3qf9ztHPU5G
    h83DN+wNjvJslPXHtUcv1mpPd/d3a/tvO91eXtvJ3p0Mhr281qo3W/XWerP+uNFo
    8ByigMQCbeDqej7fPP75pC18SGI37hxsnn9fb6+9Pt+QfsJHJPZ6PhdswFx9/HD3
    2wM/JgPBbBmrSRVPVJzYm1jHidUyarSsYabhQjlNGUhnkdMCA4UJwIqmvGZ87PLM
    tvMlzqfjwgpWJEZVeNkjnWlSh6WOAhNUGEKpNQmY2miBpyagrPy+l/i9vup0xT0T
    LXTBqbunJhbehhCKJrymPFWkZllP3rHEysXpxSsItbt/aiLXb2q35PclMVJP3+ol
    Nfz9ZS64N93Gct+Hi5lS5Utcilf2PbuZl6YwKi5s7HDs5hdSVG+IXX5EaRWlqwMr
    izreK74VIzoUForTpY+JeGRHfscyn6nfd+x3V5bwF9QwpH8=
")

/*
    SamplerState Sampler: register(s0);
    SamplerState Water;
    SamplerState Manifold;

    struct PS_INPUT {
        float4 position: POSITION0;
        float2 uv: TEXCOORD0;
        float4 color: COLOR;
    };

    struct PS_OUTPUT {
        float4 color: COLOR;
    };

    uniform float3 colorto;
    uniform float2 distort;
    uniform float2 surface;

    PS_OUTPUT main(PS_INPUT input) {
        PS_OUTPUT output;

        //red channel = water depth
        float amount = input.color.r;

        //add surface offset
        input.uv.y+=surface.y;

        //noise fetch (remove scroll)
        float4 noise = tex2D(Manifold,(input.uv-float2(surface.x,surface.y))*0.5);
        float4 noise2 = tex2D(Manifold,(input.uv.yx-float2(surface.y,surface.x))*0.5);

        //calculate offset from noise
        float2 offset = float2(noise.r-0.5,noise2.r-0.5) * ((amount+0.4)/1.4) * distort;

        //background texture fetch
        float4 diffuse = tex2D(Water,input.uv+offset);

        //get luminance for fade effect                        add caustics
        float gray = dot(diffuse.rgb,float3(0.21,0.71,0.07)) + abs(noise.r-0.5+noise2.r-0.5)*-0.15;

        //wavy surface
        if ((input.uv+(offset.y-0.1*distort.y)).y<surface.y) discard;

        //apply color fade effect
        output.color = float4(lerp(diffuse.rgb+offset.r,float3(gray,gray,gray)*colorto,amount),1);

        return output;
    }
*/
