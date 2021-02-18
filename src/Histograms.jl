function histcounts(x::AbstractArray, xmin, xmax, nbins; T=Int64)
    N = fill(zero(T), nbins)
    histcounts!(N, x, xmin, xmax, nbins)
    return N
end
export histcounts

function histcounts!(N, x, xmin, xmax, nbins)
    # What is the size of each bin?
    binwidth = (xmax-xmin)/nbins

    # Loop through each element of x
    @inbounds for i ∈ eachindex(x)
        xᵢ = x[i]
        if !isnan(xᵢ)
            binindex = Integer((xᵢ - xmin) ÷ binwidth) + 1
            if 1 <= binindex <= nbins
                N[binindex] += 1
            end
        end
    end
    return N
end
export histcounts!
