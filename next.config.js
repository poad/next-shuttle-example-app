/** @type {import('next').NextConfig} */
const nextConfig = {
    output: "export",
    distDir: "./backend/static",
    experimental: {
        appDir: true,
    },
    images: {
        unoptimized: true
    },
    trailingSlash: true
};
module.exports = nextConfig;
