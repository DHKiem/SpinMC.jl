# D.H. KIEM
# 2024-Jul-11

using SpinMC
import DataFrames, CSV

@assert(length(ARGS) > 0 ,"Error: Clarify the monte-carlo output file: julia thiscode.jl *.h5" )
    
filename = ARGS[1]
println("file: ",filename)
m = readMonteCarlo(filename)

function makecsvfile(m)

    Nspin = m.lattice.length 
    DF2 = DataFrames.DataFrame(
    rx = [m.lattice.sitePositions[i][1] for i in 1:Nspin],
    ry = [m.lattice.sitePositions[i][2] for i in 1:Nspin],
    rz = [m.lattice.sitePositions[i][3] for i in 1:Nspin],
    sx = [m.lattice.spins[1,i] for i in 1:Nspin],
    sy = [m.lattice.spins[2,i] for i in 1:Nspin],
    sz = [m.lattice.spins[3,i] for i in 1:Nspin],
    )
    show(DF2)    
    CSV.write("spin_info.csv", DF2)
    return DF2
end

DF = makecsvfile(m)




