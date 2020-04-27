import React from 'react';
import { Link } from 'react-router-dom';

export default () => {
    return (
        <div>
            Just a tiny piece of a second page for testing!
            <Link to="/">Go Back to initial page</Link>
        </div>
    );
};