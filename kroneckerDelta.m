function [d] = kroneckerDelta(m,n)
%KRONECKERDELTA Return 1 if arguments match, 0 if not.
    if (m==n)
        d = 1;
    else
        d = 0;
    end
end